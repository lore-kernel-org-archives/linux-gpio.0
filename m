From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: improve error checking and
 reporting
Date: Tue, 17 Nov 2015 07:36:23 -0600
Message-ID: <564B2D57.2080508@codeaurora.org>
References: <1447171030-15056-1-git-send-email-timur@codeaurora.org>
 <CACRpkdb4Ck4XCUEKX7TEgCg8723vZA-sxqmd753O1q9uTBszfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:48758 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752068AbbKQNg0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 08:36:26 -0500
In-Reply-To: <CACRpkdb4Ck4XCUEKX7TEgCg8723vZA-sxqmd753O1q9uTBszfQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Linus Walleij wrote:
> And I suspect Arnd would be interested to know if you are doing
> ACPI on something that is certainly not a server-class hardware.
> Because you shouldn't.

This driver is for the TLMM pin control device on Qualcomm's ARM64 
Server chip.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
