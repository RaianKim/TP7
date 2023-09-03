const radioButtons = document.querySelectorAll('.radio-label-cj .cjradio');
radioButtons.forEach(function(radioButton) {
    radioButton.addEventListener('click', function() {
        const allLabels = document.querySelectorAll('.radio-label-cj ');
        allLabels.forEach(function(label) {
            label.classList.remove('btn-danger');
            label.classList.add('btn-default');
        });
        const parentLabel = this.closest('.radio-label-cj ');
        parentLabel.classList.remove('btn-default');
        parentLabel.classList.add('btn-danger');
    });
});

const radioButtons2 = document.querySelectorAll('.radio-label-cj2 .cjradio2');
radioButtons2.forEach(function(radioButton) {
    radioButton.addEventListener('click', function() {
        const allLabels = document.querySelectorAll('.radio-label-cj2 ');
        allLabels.forEach(function(label) {
            label.classList.remove('btn-danger');
            label.classList.add('btn-default');
        });
        const parentLabel = this.closest('.radio-label-cj2 ');
        parentLabel.classList.remove('btn-default');
        parentLabel.classList.add('btn-danger');
    });
});