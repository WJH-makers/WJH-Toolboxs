# 要格式化的根文件夹
$rootFolder = "C:\Users\wjh19\Desktop\Toolbox"

# 要排除的文件夹名称
$excludeFolder = "node_modules"

# 要包含的文件夹名称
$includeFolders = @("assets", "components", "layouts", "middleware", "pages", "plugins", "server-middleware", "static", "store", "styles", "utils")

# Prettier 支持的常见文件扩展名列表 (根据你的项目调整)
$extensions = @("js", "jsx", "ts", "tsx", "vue", "css", "scss", "less", "html", "json", "md", "yaml", "yml")

# 注意: 简单逐个文件方式不需要 ThrottleLimit 或并行/批量参数

Write-Host "开始非并行格式化 (简单逐个文件方式)..."
Write-Host "以下文件已被格式化:"

$formattedFiles = @() # 初始化一个空数组来存放成功格式化的文件路径

# 循环遍历要包含的文件夹 (顺序执行)
$includeFolders | ForEach-Object {
    $includeFolder = $_
    # 循环遍历文件扩展名
    foreach ($ext in $extensions) {
        # 获取当前文件夹和扩展名匹配的文件列表，并排除 node_modules 文件夹
        # 然后使用 ForEach-Object (不带 -Parallel) 顺序处理每一个文件
        Get-ChildItem -Path "$rootFolder\$includeFolder" -Recurse -Filter "*.${ext}" -Exclude "*\\$excludeFolder\\*" -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer } | ForEach-Object {
            # Process each file one by one sequentially
            $file = $_.FullName # 获取当前文件的完整路径

            # Write-Host "正在处理文件: $file" # 如果需要更详细的实时进度，可以取消注释

            # 运行 prettier --write 命令来格式化当前文件
            # 使用 & 运算符直接运行外部命令 npx
            # 将 npx 的标准输出和标准错误捕获到 $prettierOutput 变量
            $prettierOutput = & npx prettier --write "$file" 2>&1
            $exitCode = $LASTEXITCODE # 获取上一个命令 (npx) 的退出码

            # 检查 Prettier 是否成功运行并且报告修改了文件
            # Prettier --write 如果成功修改了文件，会将其路径打印到标准输出 (通常退出码是 0)
            # 如果文件已符合格式，退出码是 0，但标准输出是空的
            if ($exitCode -eq 0 -and $prettierOutput.Trim()) {
                # 文件被格式化/修改了
                Write-Host "  $file" # 打印格式化成功的 文件路径
                $formattedFiles += $file # 将文件添加到已格式化列表
            } elseif ($exitCode -ne 0) {
                # Prettier 运行时发生错误 (非零退出码)
                Write-Host "格式化文件时出错 (退出码: $exitCode): $file" -ForegroundColor Red
                Write-Host "错误详情:`n$prettierOutput" -ForegroundColor Red
                # 这个文件不会添加到 $formattedFiles 列表
            }
            # 如果 $exitCode 是 0 且 $prettierOutput 为空，表示文件已符合格式，无需修改，什么也不做。

            # Write-Host "" # 如果需要额外的空行分隔，可以取消注释
        }
    }
}

Write-Host ""
# 使用 Select-Object -Unique 防止列表中有重复项 (在这个版本中理论上不会重复)
$uniqueFormattedFiles = $formattedFiles | Select-Object -Unique

if ($uniqueFormattedFiles.Count -gt 0) {
    Write-Host "格式化完成！共格式化了 $($uniqueFormattedFiles.Count) 个文件 (已排除 $excludeFolder 文件夹 - 简单逐个文件方式)。"
} else {
    Write-Host "格式化完成！没有文件需要修改 (已排除 $excludeFolder 文件夹 - 简单逐个文件方式)。"
    # 如果列表中没有文件，可能是没有需要修改的，也可能是获取文件列表或执行 Prettier 失败
     # 只有当实际找到文件，但没有一个被报告格式化时，才提示可能存在错误
     # 简单检查 $formattedFiles 是否为空，并且 $filesToProcess (虽然这里没有显式统计) 可能不为空
    if ($formattedFiles.Count -eq 0) {
        # 这里的 Get-ChildItem 是在 ForEach-Object 内部，无法直接获取总数
        # 如果需要判断是否有文件被找到但未格式化，需要先统计 $filesToProcess (像批量版本那样)
        # 在这个简单版本中，我们只基于 $formattedFiles 的最终计数报告。
        # 如果上面有红色错误，用户会看到。
    }
}