Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF00EC43334
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jun 2022 14:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344042AbiFJOqb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 10 Jun 2022 10:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344565AbiFJOqB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 10:46:01 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEE21D08B4;
        Fri, 10 Jun 2022 07:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654872360; x=1686408360;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=G5Mq1zGVGfkkmMwTmuaJBFCVa7RrGwT6IWEMgxihHzk=;
  b=nx07sDHLroTP2/L9xPEpm+RThp4+DvdJgbQ7LwQbQ/DIhEaCjTFD4xZk
   rAtIOLgl/SwfP6VQodR9g6Z1t7l8rWzF9DKENnugLpGnq86khpjg/8ee6
   +GdpoIb9goP5IQ0nx4MbQCIUacnVpD1Hx6J4S5X+P+Ot3HE70CR+GzGBB
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Jun 2022 07:45:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 07:45:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 07:45:58 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 07:45:51 -0700
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
Subject: [PATCH v3 0/2] [PATCH v3 0/2] Add pinctrl support adsp bypass platforms
Date:   Fri, 10 Jun 2022 20:15:33 +0530
Message-ID: <1654872335-4993-1-git-send-email-quic_srivasam@quicinc.com>
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

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml          | 9 ++++++++-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c                         | 3 +++
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c                  | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.7.4

