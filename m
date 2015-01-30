From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 0/3] pinctrl: qcom: enable generic pinconf and input-enable
Date: Fri, 30 Jan 2015 12:27:21 +0200
Message-ID: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: linux-gpio@vger.kernel.org

Here is splitted version of the previous patch at [1].

The major change is in 3/3 where now we check oe_bit in control register
instead of in_bit in io register.

regards
Stan

[1] https://lkml.org/lkml/2015/1/26/514

Stanimir Varbanov (3):
  pinctrl: qcom: delete pin_config_get/set pinconf operations
  pinctrl: qcom: enable generic pinconf
  pinctrl: qcom: handle input-enable pinconf property

 drivers/pinctrl/qcom/pinctrl-msm.c |   32 ++++++++++++--------------------
 1 files changed, 12 insertions(+), 20 deletions(-)
