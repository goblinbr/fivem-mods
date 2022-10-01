$(document).ready(function () {
  HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
    color: "rgb(201, 36, 36)",
    trailColor: "rgba(0, 0, 0, 0)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
    color: "rgb(130, 255, 230)",
    trailColor: "rgba(0, 0, 0, 0)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  StaminaIndicator = new ProgressBar.Circle("#StaminaIndicator", {
    color: "rgb(255, 230, 45)",
    trailColor: "rgb(105, 95, 20)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
    color: "rgb(255, 164, 59)",
    trailColor: "rgb(165, 116, 60)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "rgb(0, 85, 155)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  StressIndicator = new ProgressBar.Circle("#StressIndicator", {
    color: "rgb(255, 74, 104)",
    trailColor: "rgb(102, 27, 40)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
    color: "rgb(0, 140, 255)",
    trailColor: "rgb(0, 85, 155)",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });

  FuelIndicator = new ProgressBar.Circle("#FuelCircle", {
    color: "rgba(222, 222, 222, 1)",
    trailColor: "rgba(184, 184, 184, 0.082)",
    strokeWidth: 8,
    duration: 2000,
    trailWidth: 8,
    easing: "easeInOut",
  });

  VoiceIndicator = new ProgressBar.Circle("#VoiceIndicator", {
    color: "#4a4a4a",
    trailColor: "#4a4a4a",
    strokeWidth: 15,
    trailWidth: 15,
    duration: 250,
    easing: "easeInOut",
  });
  VoiceIndicator.animate(0.66);
});

window.addEventListener("message", function (event) {
  let data = event.data;

  if (data.action == "update_hud") {
    HealthIndicator.animate(data.hp / 100);
    ArmorIndicator.animate(data.armor / 100);
    StaminaIndicator.animate(data.stamina / 100);
    HungerIndicator.animate(data.hunger / 100);
    ThirstIndicator.animate(data.thirst / 100);
    StressIndicator.animate(data.stress / 100);
    OxygenIndicator.animate(data.oxygen / 100);

    $('#HealthPoints').text(Math.round(data.healthPoints));
    $('#ArmorPoints').text(Math.round(data.armorPoints));
    $('#StaminaPoints').text(Math.round(data.staminaPoints));
    $('#HungerPoints').text(Math.round(data.hunger));
    $('#ThirstPoints').text(Math.round(data.thirst));
    $('#StressPoints').text(Math.round(data.stress));
    $('#OxygenPoints').text(Math.round(data.oxygen));
  }

  // Get current voice level and animate path
  if (data.action == "voice_level") {
    switch (data.voicelevel) {
      case 1:
        data.voicelevel = 33;
        break;
      case 2:
        data.voicelevel = 66;
        break;
      case 3:
        data.voicelevel = 100;
        break;
      default:
        data.voicelevel = 33;
        break;
    }
    VoiceIndicator.animate(data.voicelevel / 100);
  }

  // Light up path if talking
  if (data.talking == 1) {
    VoiceIndicator.path.setAttribute("stroke", "white");
  } else if (data.talking == false) {
    VoiceIndicator.path.setAttribute("stroke", "darkgrey");
  }

  // Headset icon if using radio
  if (data.radio == true) {
    $("#VoiceIcon").removeClass("fa-microphone");
    $("#VoiceIcon").addClass("fa-headset");
  } else if (data.radio == false) {
    $("#VoiceIcon").removeClass("fa-headset");
    $("#VoiceIcon").addClass("fa-microphone");
  }

  // Hide stress if disabled
  if (data.action == "disable_stress") {
    $("#StressIndicator").parent().hide();
  }

  // Hide voice if disabled
  if (data.action == "disable_voice") {
    $("#VoiceIndicator").parent().hide();
  }

  // Show oxygen if underwater
  if (data.showOxygen == true) {
    $("#OxygenIndicator").parent().show();
  } else if (data.showOxygen == false) {
    $("#OxygenIndicator").parent().hide();
  }

  // Hide armor if 0
  //if (data.armor == 0) {
    //$("#ArmorIndicator").fadeOut();
  //} else if (data.armor > 0) {
    //$("#ArmorIndicator").fadeIn();
  //}

  if (data.stress == 0) {
    $("#StressIndicator").fadeOut();
  } else if (data.stress > 0) {
    $("#StressIndicator").fadeIn();
  }

  // Change color and icon if HP is 0 (dead)
  if (data.hp < 0) {
    HealthIndicator.animate(0);
    $("#hp-icon").removeClass("fa-heart");
    $("#hp-icon").addClass("fa-skull");
  } else if (data.hp > 0) {
    $("#hp-icon").removeClass("fa-skull");
    $("#hp-icon").addClass("fa-heart");
  }

  // Flash if thirst is low
  if (data.thirst < 25) {
    $("#ThirstIcon").toggleClass("flash");
  }
  // Flash if hunger is low
  if (data.hunger < 25) {
    $("#HungerIcon").toggleClass("flash");
  }
  // Flash if stamina is low
  if (data.stamina < 25) {
    $("#StaminaIndicator").toggleClass("flash");
  }

  if (data.speed > 0) {
    $("#SpeedIndicator").text(data.speed);
  } else if (data.speed == 0) {
    $("#SpeedIndicator").text("0");
  }

  if (data.unitOfSpeed) {
    if (data.unitOfSpeed == 'kmh') {
      $("#SpeedMed").text("km/h");
    } else {
      $("#SpeedMed").text("mp/h");
    }
  }

  if (data.action == "update_fuel") {
    let finalfuel = (data.fuel / 100) * 1.5385;
    if (finalfuel > 0.9) {
      FuelIndicator.animate(1.0);
    } else if (finalfuel < 0.9) {
      FuelIndicator.animate(finalfuel);
    }
    if (finalfuel < 0.2) {
      FuelIndicator.path.setAttribute("stroke", "red");
    } else if (finalfuel > 0.2) {
      FuelIndicator.path.setAttribute("stroke", "white");
    }
  }

  if (data.showSpeedo == true) {
    $("#VehicleContainer").fadeIn();
  } else if (data.showSpeedo == false) {
    $("#VehicleContainer").fadeOut();
  }

  if (data.showFuel == true) {
    $("#FuelCircle").show();
  } else if (data.showFuel == false) {
    $("#FuelCircle").hide();
  }

  if (data.showUi == true) {
    $(".container").show();
  } else if (data.showUi == false) {
    $(".container").hide();
  }

  if (data.action == "toggle_hud") {
    $("body").fadeToggle()
  }

  if (data.showIcons) {
    $(".IconContainer").show();
  }
});
