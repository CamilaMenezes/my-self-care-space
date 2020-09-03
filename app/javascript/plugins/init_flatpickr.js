import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr("#order_reservation", {
    enableTime: true,
    minDate: new Date(Date.now() + 86400000),
    dateFormat: "Y-m-d H:i",
    inline: true,
    time_24hr: true
  });
};

export { initFlatpickr };