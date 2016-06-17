From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] pinctrl: Add MDM9615 TLMM pinctrl driver and bindings
Date: Fri, 17 Jun 2016 12:15:33 +0200
Message-ID: <1466158535-17962-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35685 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751548AbcFQKPo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2016 06:15:44 -0400
Received: by mail-wm0-f49.google.com with SMTP id v199so224078860wmv.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jun 2016 03:15:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, andy.gross@linaro.org, sricharan@codeaurora.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org

In order to support the Qualcomm MDM9615 in the Sierra Wireless WP8548
Modules, add the MDM9615 TLMM pinctrl driver and bindings.

This patchset is part of a global SoC + Module + Board support for the
Sierra Wireless mangOH Board support with the WP8548 module.

Neil Armstrong (2):
  pinctrl: qcom: Add support for MDM9615 TLMM
  dt-bindings: pinctrl: Add MDM9615 TLMM bindings

 .../bindings/pinctrl/qcom,mdm9615-pinctrl.txt      | 152 +++++++
 drivers/pinctrl/qcom/Kconfig                       |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-mdm9615.c             | 483 +++++++++++++++++++++
 4 files changed, 644 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-mdm9615.c

-- 
1.9.1

