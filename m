From: Douglas Anderson <dianders@chromium.org>
Subject: [RFT PATCH 0/2] pinctrl: Fix two more xxx_config_get() functions to be compliant
Date: Thu, 30 Aug 2018 08:23:37 -0700
Message-ID: <20180830152340.242249-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Ivan T . Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

I have no way to test the patches in this series, but Stephen Boyd
pointed out the problems being fixed here when he reviewed my patch
("pinctrl: qcom: spmi-gpio: Fix pmic_gpio_config_get() to be
compliant").  It seemed nice to (finally) follow-up and address the
problems that Stephen found.  Hopefully someone can test them out and
make sure they work as advertised.


Douglas Anderson (2):
  pinctrl: ssbi-gpio: Fix pm8xxx_pin_config_get() to be compliant
  pinctrl: spmi-mpp: Fix pmic_mpp_config_get() to be compliant

 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c  | 19 ++++++++++------
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 28 ++++++++++++++++++------
 2 files changed, 33 insertions(+), 14 deletions(-)

-- 
2.19.0.rc0.228.g281dcd1b4d0-goog
