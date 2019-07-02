Return-Path: <SRS0=cLbR=U7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252A7C06510
	for <linux-gpio@archiver.kernel.org>; Tue,  2 Jul 2019 10:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E93E820659
	for <linux-gpio@archiver.kernel.org>; Tue,  2 Jul 2019 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562064855;
	bh=p/6kpZRVuYcmAKV9AA32HXPzBIcdjFZSr6MNglqmZU4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=is/BY9r/N1tusitF2waiTDwiGzc5BAPq1SBm9KGn0a9zPFFqfEMLw+9CD+MMWncua
	 bdkr7C6sCzk89i5EdpGDY5xVhPI7XvHX54f/Fd4ZXaD169pGKntWl5ba2TQpcQ7wv7
	 CAer/ph32e6I0ZNM9xa7ZHai2UZgQUkQp5q4yy+Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGBKyK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 2 Jul 2019 06:54:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbfGBKyK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jul 2019 06:54:10 -0400
Received: from vkoul-mobl.Dlink (unknown [49.207.58.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37A3020659;
        Tue,  2 Jul 2019 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562064849;
        bh=p/6kpZRVuYcmAKV9AA32HXPzBIcdjFZSr6MNglqmZU4=;
        h=From:To:Cc:Subject:Date:From;
        b=s10W2HPOfV17SKau5EJj3XHdMNWutjyA2L8emWuqeBcgNjN4wv2AlsdoM++r4WWaf
         JxgVJ3z5dd0JaZK8oM8zpKAwfpZgxNxxbzBL0ZHd1+EuqK32wQ0wGMS41DFgD6R2UO
         7gkppgnp7T9gFLTb8f2W2JAdJJQYJtNDTlErxNy4=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ipinctrl: qcom: Add support for SM8150
Date:   Tue,  2 Jul 2019 16:20:42 +0530
Message-Id: <20190702105045.27646-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds binding and driver for SM8150 pinctrl block. Also fixes one
binding missing gpio node for msm8998.

Changes since v2:
 - Order the function names and squash functions
 - document gpio-ranges and gpio-reserved-ranges
 - change ufs reset to be after gpios
 - fix pin58 having qdss_cti twice
 - remove .owner
 - Add one patch for missing gpio nodes

Prasad Sodagudi (2):
  dt-bindings: pinctrl: qcom: Add SM8150 pinctrl binding
  pinctrl: qcom: Add SM8150 pinctrl driver

Vinod Koul (1):
  dt-bindings: pinctrl: qcom: Document missing gpio nodes

 .../bindings/pinctrl/qcom,msm8998-pinctrl.txt |   10 +
 .../bindings/pinctrl/qcom,sm8150-pinctrl.txt  |  190 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8150.c         | 1548 +++++++++++++++++
 5 files changed, 1758 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8150.c

-- 
2.20.1

