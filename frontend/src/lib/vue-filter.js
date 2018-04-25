const truncat = (text, stop, clamp) => text.slice(0, stop) + (stop < text.length ? clamp || '...' : '')


export default {
    truncat
}
