From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 0/3] pinctrl: msm interrupt and muxing fixes
Date: Wed, 25 Jul 2018 15:28:57 -0700
Message-ID: <20180725222900.33231-1-swboyd@chromium.org>
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

The discussion never really completed on the previous thread so I'm just
resending these patches to restart the conversation. In the cases
where a driver needs to do both pinctrl muxing for some non-gpio
function and also GPIO control they'll need to explicitly mux the pins
at the right time. If we force them to mux the pins into the function
mode after requesting the GPIO at boot then we'll be better off because
it will force the code to mux out the function or GPIO explicitly all
the time.

We will have a case in the near future where the UART driver will want
to mux the RX pin into GPIO mode so it can get a wakeup interrupt during
suspend path and then swizzle the pin back into QUP/UART mode when the
wakeup interrupt isn't necessary anymore. In this case, I imagine the
driver will request the pin as an interrupt during probe, that will
convert the GPIO into an irq and mux it out as a GPIO function input
pin, disable that IRQ because it's only needed at suspend time, and then
need to explicitly mux the device into "UART" mode before finishing
driver probe. Then when it goes into suspend, it will need to remux the
pin as a GPIO function input pin, enable the irq, and wait for wakeup.
On resume, it will disable the irq and remux the pin as "UART" mode.

Changes from v1:
 * Squashed the raw status bit part into the same write in unmask path
   based on suggestion from Doug Andersson

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>

Stephen Boyd (3):
  pinctrl: msm: Really mask level interrupts to prevent latching
  pinctrl: msm: Mux out gpio function with gpio_request()
  pinctrl: msm: Configure interrupts as input and gpio mode

 drivers/pinctrl/qcom/pinctrl-msm.c | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

-- 
Sent by a computer through tubes
