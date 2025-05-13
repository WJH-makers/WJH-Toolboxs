<template>
    <div class="windows_command">
        <client-only>
            <modal v-if="showModal" adaptive classes="readCommand_modal" height="auto" name="readCommand"
                   scrollable width="800px" @closed="clearCommandDetail">
                <div class="title">
                    {{ command }} 命令详情
                </div>
                <Dynamic :template="content" class="content typo" />
                <div class="close-modal" @click="hideModal">
                    关闭
                </div>
            </modal>
        </client-only>
        <nya-container title="Windows 命令查询">
            <nya-input
                v-model.trim="searchVal"
                :label="geting ? '加载数据中···' : '请输入要查询的 Windows 命令'"
                autocomplete="off"
                autofocus
                fullwidth
                placeholder="ipconfig"
            />
            <div v-show="searchVal && searchResults.length > 0" class="nya-subtitle">
                搜索结果（点击查看详情）
            </div>
            <div v-show="searchVal && searchResults.length === 0 && !geting" class="nya-subtitle">
                没有找到匹配的命令。
            </div>
            <ul v-show="searchVal && searchResults.length > 0" class="nya-list">
                <li v-for="(item, index) in searchResults" :key="index" @click="query(item)">
                    <b>{{ data[item].n }}</b>：{{ data[item].d }}
                </li>
            </ul>
        </nya-container>

        <nya-container v-if="results" title="外部文档链接">
            <a :href="results" rel="noopener noreferrer" target="_blank">
                {{ results }}
            </a>
        </nya-container>

        <nya-container title="说明">
            <ul class="nya-list">
                <li>这是一个基于本地数据的 Windows 命令查询工具。</li>
                <li>数据来源于项目本地的 `/static/windows_commands/data.json` 文件和 `/static/windows_commands/command/`
                    文件夹下的 Markdown 文件。
                </li>
                <li>您可以编辑这些本地文件来增加或修改命令信息。</li>
            </ul>
        </nya-container>
    </div>
</template>

<script>
import dayjs from 'dayjs';
// 假设您有用于 Windows 命令文档的 Markdown 转换工具
import md from '~/utils/markdown.js';
import Dynamic from '@/components/Dynamic';
// 导入本地 JSON 文件
import localCommandData from 'static/windows_commands/data.json'; // 注意这里的路径是相对于项目根目录/static

// 本地存储数据的 key
const LOCAL_STORAGE_KEY = 'windows_command_data_local';

export default {
    name: 'WindowsCommand', // 修改组件名称
    components: {
        Dynamic
    },
    head() {
        return {
            title: 'Windows 命令查询 - MikuTools',
            meta: [
                {
                    hid: 'keywords',
                    name: 'keywords',
                    content:
                        'Windows 命令查询, cmd 命令, PowerShell 命令, 本地查询工具'
                },
                {
                    hid: 'description',
                    name: 'description',
                    content: '一个基于本地数据的 Windows 常用命令查询工具。'
                }
            ]
        };
    },
    data() {
        return {
            geting: true,
            data: {}, // 存放命令列表数据
            searchVal: '', // 搜索框的值
            command: null, // 当前查询的命令名
            commandData: null, // 当前查询的命令详情数据 (Markdown 文本)
            results: '', // 可能用于显示外部链接
            showModal: false // 控制模态框显示与隐藏
        };
    },
    computed: {
        searchResults() {
            if (!this.data) return []; // 确保数据已加载
            // 假设数据结构依然是 { n: '命令名', d: '简要描述' } 的对象组成的列表
            return Object.keys(this.data).filter(comm => {
                const commandItem = this.data[comm];
                // 增加对 commandItem 和 commandItem.n 的有效性检查
                return (
                    commandItem &&
                    commandItem.n &&
                    commandItem.n
                        .toString()
                        .toLowerCase()
                        .indexOf(this.searchVal.toLowerCase()) >= 0
                );
            });
        },
        content() {
            // 将命令详情数据转换为 Markdown 格式以便 Dynamic 组件渲染
            return this.commandData ? md(this.commandData) : '';
        }
    },
    watch: {
        // 当搜索框清空时，也清空外部链接和之前的详情
        searchVal(val) {
            if (!val) {
                this.results = '';
                this.command = null;
                this.commandData = null;
            }
        }
    },
    mounted() {
        // 直接加载本地数据，本地存储依然用于缓存这个本地数据（非必须，但保留原有逻辑）
        // 检查本地存储，如果数据存在且未过期（这里的过期检查对于本地数据意义不大，但保留原有逻辑）
        if (this.$db && this.$db.get(LOCAL_STORAGE_KEY).value()) {
            const storageData = this.$db.get(LOCAL_STORAGE_KEY).value();
            if (storageData && storageData.data) {
                // 简单检查数据结构是否有效
                if (
                    typeof storageData.data === 'object' &&
                    Object.keys(storageData.data).length > 0
                ) {
                    console.log(
                        'Using Windows commands data from local storage.'
                    );
                    this.data = storageData.data;
                    this.geting = false;
                } else {
                    // 本地存储数据无效，使用导入的本地文件数据
                    console.warn(
                        'Local storage data for Windows commands is invalid or empty, using imported data.'
                    );
                    this.useImportedData();
                }
            } else {
                // 本地存储数据格式不正确，使用导入的本地文件数据
                console.warn(
                    'Local storage data for Windows commands is not in the expected format, using imported data.'
                );
                this.useImportedData();
            }
        } else {
            // 本地存储没有数据，使用导入的本地文件数据
            console.log(
                'No Windows commands data in local storage, using imported data.'
            );
            this.useImportedData();
        }
    },
    methods: {
        useImportedData() {
            // 直接使用导入的本地 JSON 数据
            if (
                localCommandData &&
                typeof localCommandData === 'object' &&
                Object.keys(localCommandData).length > 0
            ) {
                this.data = localCommandData;
                // 同样将导入的数据存入本地存储（可选，为了保留原有逻辑）
                if (this.$db) {
                    this.$db
                        .set(LOCAL_STORAGE_KEY, {
                            time: dayjs().unix(), // 使用当前时间戳
                            data: localCommandData
                        })
                        .write();
                    console.log(
                        'Imported Windows commands data saved to local storage.'
                    );
                } else {
                    console.warn(
                        'Lowdb plugin not available, imported data will not be saved locally.'
                    );
                }
                this.geting = false;
            } else {
                // 如果导入的本地数据本身无效或不存在
                console.error('Error loading imported local command data.');
                this.$swal({
                    type: 'error',
                    title: '加载失败',
                    text:
                        'ERROR: 无法加载本地命令数据文件！请检查 /static/windows_commands/data.json 是否存在且格式正确。'
                });
                this.geting = false;
            }
        },
        query(commandKey) {
            // 使用命令的 key (如 'ipconfig') 来查询详情
            this.clear();
            this.$store.commit('SET_STORE', {
                key: 'globalLoading',
                value: true
            });
            this.command = this.data[commandKey]?.n || commandKey; // 先显示命令名或 key

            // 从本地的 static 目录获取命令详情的 Markdown 文件
            // 使用 this.$axios 获取本地文件
            this.$axios
                .get(`/windows_commands/CommandDocs/${commandKey}.md`) // 注意这里的路径是相对于 static 目录的根路径
                .then(e => {
                    this.commandData = e.data; // 假设返回的是 Markdown 文本
                    this.$store.commit('SET_STORE', {
                        key: 'globalLoading',
                        value: false
                    });
                    this.showModal = true; // 控制模态框显示
                    console.log(
                        `Workspaceed local detail for command: ${commandKey}`
                    );
                })
                .catch(err => {
                    // 获取本地文件失败时的处理
                    console.error(
                        `Error fetching local detail for command: ${commandKey}`,
                        err
                    );
                    // 如果本地 Markdown 文件不存在，可以尝试提供一个外部链接作为备用
                    this.results = `https://docs.microsoft.com/zh-cn/search/?terms=${commandKey}`; // 微软文档搜索链接示例
                    this.$swal({
                        type: 'error',
                        title: '查询失败',
                        text: `ERROR: 无法加载本地命令详情文件（/static/windows_commands/CommandDocs/${commandKey}.md）。已尝试提供微软文档搜索链接（在“外部文档链接”处显示）。 ${err}`
                    });
                    this.$store.commit('SET_STORE', {
                        key: 'globalLoading',
                        value: false
                    });
                });
        },
        clearCommandDetail() {
            // 模态框关闭后清空命令详情数据
            this.command = null;
            this.commandData = null;
        },
        hideModal() {
            this.showModal = false;
        },
        clear() {
            // 清空外部链接
            this.results = '';
            // 清空详情，当模态框关闭时会调用 clearCommandDetail
            // this.command = null;
            // this.commandData = null;
        }
    }
};
</script>

<style lang="scss">
.windows_command {
    .nya-subtitle {
        margin-top: 15px;
    }

    .nya-subtitle + .nya-list {
        margin-top: 0; /* 调整间距 */
    }

    li {
        cursor: pointer;

        &:active,
        &:hover {
            text-decoration: underline;
        }
    }

    .readCommand_modal {
        padding: 15px;
        border-radius: 5px;
        background-color: var(--t2);
        max-width: 100%;

        .title {
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dad9d9;
        }

        .close-modal {
            text-align: center;
            padding-top: 15px;
            font-weight: bold;
            border-top: 1px solid #dad9d9;
            margin-top: 15px;
            font-size: 20px;
            cursor: pointer;
        }

        .content {
            max-height: 60vh; /* 限制内容高度，避免内容过长 */
            overflow-y: auto; /* 内容溢出时显示滚动条 */
        }
    }
}
</style>
