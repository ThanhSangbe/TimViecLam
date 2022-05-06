function monthChart(id, lables = [], info = []) {
    let colors = []
    for (let i = 0; i < lables.length; i++)
    {
        colors.push(generateColor())
    }
    const data = {
        labels = lables,
        datasets: [{
                label: 'Thống kê',
                data: info,
                backgroundColor: colors,
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                hoverOffest: 4
            }]
    };
    const config = {
        type = 'line', data = data
    }
    let ctx = document.getElementById(id).getContext('2d')
    new Chart(ctx, config)
}

