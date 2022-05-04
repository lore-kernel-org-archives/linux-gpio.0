Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCFBC433F5
	for <linux-gpio@archiver.kernel.org>; Wed,  4 May 2022 13:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347486AbiEDOBh (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 May 2022 10:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351072AbiEDOB1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 10:01:27 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0024132D;
        Wed,  4 May 2022 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651672601; x=1683208601;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=HXCIqbaLh6yrEEal7IAfU/afzOMo3j4i26wJisWHsoQ=;
  b=TzGb7scW7VOplooawGXADl2LyjXYARJS3laSu84mgn1AJjaucMVUe2Pl
   LayJJoY638DzZCtyk95v0qwzihtI04CU3RJS0BGfjUarGRyooSV/XQipp
   kW6T23dFsL6quSU3Fig9dw4kU68GoDjLDSoQVwCSxEZIFtHiXDRe80diJ
   E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 06:56:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 06:56:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 06:56:39 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 06:56:33 -0700
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
Subject: [PATCH 0/2] Add pinctrl support adsp based platforms
Date:   Wed, 4 May 2022 19:26:18 +0530
Message-ID: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set is to add pinctrl support adsp enabled sc7280 platforms.

Srinivasa Rao Mandadapu (2):
  dt-bindings: pinctrl: qcom: sc7280: Add compatible string for adsp
    based platforms
  pinctrl: qcom: sc7280: Add lpi pinctrl variant data structure for adsp
    based targets

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml    |  4 +++-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c            | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.7.4

