export function decodeToken(token) {
    const _decodeToken = (t) => {
        try {
            return JSON.parse(atob(t));
        } catch {
            return;
        }
    };
    return token
        .split('.')
        .map(t => _decodeToken(t))
        .reduce((acc, curr) => {
                if (!!curr) {
                    acc = {...acc, ...curr};
                }
                return acc;
            },
            Object.create(null)
        );
}
