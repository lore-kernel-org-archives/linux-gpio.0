Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BE4C43334
	for <linux-gpio@archiver.kernel.org>; Mon, 27 Jun 2022 07:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiF0Htv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 27 Jun 2022 03:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232986AbiF0Htu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 03:49:50 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD56C2DD3;
        Mon, 27 Jun 2022 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656316190; x=1687852190;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ot6ZzLJfsJy2wfTJYmauJNIOEnRIseAlsYBRCJcdO1A=;
  b=SKsiKrlOxATlSdQ3OOUUgVWIbuBOgKBLreUe1mZU8uGmKOJY9BmQnnWQ
   w3+ZlCyt9v3G8D4UU9EeDbwBzzPiOuQu6Ez1sNpLrPZHsW8Pbrxozc9/d
   aL2yM4VKeFxBuXN7rW/6MiNO8I/zzWMIb0/EqKnHMg7OQ4ooWQEdqNLDw
   o=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 00:49:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 00:49:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 00:49:48 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 00:49:42 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v5 0/2]  Add pinctrl support adsp bypass platforms
Date:   Mon, 27 Jun 2022 13:19:22 +0530
Message-ID: <1656316164-28666-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set is to make clock voting optinal for adsp bypass 
sc7280 platforms.
Changes Since V4:
    -- Fix the improper device node variable usage.
    -- Optimize the code by removing redundant private 
	variant data structure variable "is_clk_optional".
Changes Since V3:
    -- Revert compatible type change in dt bindings.
    -- Update boolean flag description in dt bindings.
    -- Drop redundant clock optional flag initialization.
    -- Remove redundant if check.
Changes Since V2:
    -- Remove redundant lpi pincontrol variant data structure and 
       compatible entry.
    -- Add adsp bypass mode boolean param check.
    -- Remove compatible name in dt bindings.
    -- Update dt binding bypass mode boolean param.
Changes Since V1:
    -- Update commit message.
 
Srinivasa Rao Mandadapu (2):
  dt-bindings: pinctrl: qcom: sc7280: Add boolean param for ADSP bypass
    platforms
  pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass
    targets

 .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml   | 5 +++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c                             | 2 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h                             | 1 -
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c                      | 1 -
 4 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.7.4

