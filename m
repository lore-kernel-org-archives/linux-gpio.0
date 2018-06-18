From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 0/3] pinctrl: msm interrupt and muxing fixes
Date: Mon, 18 Jun 2018 13:52:52 -0700
Message-ID: <20180618205255.246104-1-swboyd@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Here's a collection of pinctrl fixes for the qcom driver that
make things a little smoother for DT writers while also fixing
a problem seen with level triggered interrupts.

The first patch fixes an issue where we always see one extra level
triggered interrupt when the interrupt triggers. The second and third
patches make things nice for DT writers so they don't have to explicitly
mux out pins as 'GPIO' function and as 'input' instead of output so that
interrupts work properly and also makes sure that a gpio is muxed out
properly to 'GPIO' function when a gpio is requested by gpiod_request()
and friends.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>

Stephen Boyd (3):
  pinctrl: msm: Really mask level interrupts to prevent latching
  pinctrl: msm: Mux out gpio function with gpio_request()
  pinctrl: msm: Configure interrupts as input and gpio mode

 drivers/pinctrl/qcom/pinctrl-msm.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

-- 
Sent by a computer through tubes
