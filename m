Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA455C7EE23
	for <linux-gpio@archiver.kernel.org>; Wed, 10 May 2023 14:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237326AbjEJOGj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 May 2023 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237183AbjEJOGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 10:06:37 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBA7DC6A
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:06:10 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id ce6e2510-ef3b-11ed-abf4-005056bdd08f;
        Wed, 10 May 2023 17:06:06 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 10 May 2023 17:06:06 +0300
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     andy.shevchenko@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v6 2/4] pinctrl: qcom: Remove the msm_function struct
Message-ID: <ZFukzjISTb4mQs3L@surfacebook>
References: <1683718725-14869-1-git-send-email-quic_rohiagar@quicinc.com>
 <1683718725-14869-3-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683718725-14869-3-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wed, May 10, 2023 at 05:08:43PM +0530, Rohit Agarwal kirjoitti:
> Remove the msm_function struct to reuse the generic pinfunction
> struct. Also, define a generic PINFUNCTION macro that can be used across
> qcom target specific pinctrl files to avoid code repetition.

With ~330 LoCs removed!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you!

> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


