import {Socket} from 'phoenix'
import {locale} from './locale'

const socket = new Socket('/socket')
socket.connect()

export default socket
