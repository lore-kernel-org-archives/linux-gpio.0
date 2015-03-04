From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: enable generic pinconf and input-enable
Date: Wed,  4 Mar 2015 12:41:55 +0200
Message-ID: <1425465717-27747-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

From: Stanimir Varbanov <stanimir.varbanov@linaro.org>

v1 -> v2

 - addressed a review comment from Linus about returned error in 1/2
 - added Reviewed-by tag in 1/2
 - 2/2 has no changes

First version of the patchset can be found at
https://lkml.org/lkml/2015/1/30/202

----------------------------------------------------------------------------
v1:

Here is splitted version of the previous patch at [1].

The major change is in 3/3 where now we check oe_bit in control register
instead of in_bit in io register.

regards
Stan

[1] https://lkml.org/lkml/2015/1/26/514

Stanimir Varbanov (2):
  pinctrl: qcom: enable generic pinconf
  pinctrl: qcom: handle input-enable pinconf property

 drivers/pinctrl/qcom/pinctrl-msm.c |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)
