From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] [v2] pinctrl: add support for Qualcomm Technologies
 QDF2xxx ARM64 SoCs
Date: Wed, 15 Jul 2015 11:37:35 -0700
Message-ID: <20150715183735.GG32767@usrtlx11787.corpusers.net>
References: <1436978834-7271-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:9239 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751592AbbGOShk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 15 Jul 2015 14:37:40 -0400
Content-Disposition: inline
In-Reply-To: <1436978834-7271-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vipul Gandhi <vgandhi@codeaurora.org>

On Wed 15 Jul 09:47 PDT 2015, Timur Tabi wrote:

> Add the pinctrl driver for the Qualcomm Technologies QDF2xxx ARM64 SoCs,
> which uses the Qualcomm Technologies TLMM pinctrl/gpio device.  This
> driver is probed via ACPI and uses the pinctrl-msm.c backend driver.
> 
> This driver is intended to be used only an ACPI-enabled system.  As such,
> UEFI will handle all pin control configuration, so this driver does not
> provide pin control functions.  It is effectively a GPIO-only driver.
> 
> Signed-off-by: Timur Tabi <timur@codeaurora.org>
> ---

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
