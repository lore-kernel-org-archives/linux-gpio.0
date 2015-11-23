From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: improve error checking and
 reporting
Date: Mon, 23 Nov 2015 10:02:02 -0800
Message-ID: <20151123180202.GM30882@usrtlx11787.corpusers.net>
References: <1447171030-15056-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:17902 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752113AbbKWSCI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 23 Nov 2015 13:02:08 -0500
Content-Disposition: inline
In-Reply-To: <1447171030-15056-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue 10 Nov 07:57 PST 2015, Timur Tabi wrote:

> The driver doesn't report an error message if the ACPI tables are missing
> the num-gpios property (which indicates how many GPIOs there are on this
> SOC), and it didn't check to ensure that the mallocs didn't fail.
> 
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
