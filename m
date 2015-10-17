From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] pinctrl: ssbi: fix function name typo
Date: Sat, 17 Oct 2015 10:11:25 -0700
Message-ID: <20151017171125.GQ24668@usrtlx11787.corpusers.net>
References: <6327573.Mj84IgUkQi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:6250 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751697AbbJQRLa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sat, 17 Oct 2015 13:11:30 -0400
Content-Disposition: inline
In-Reply-To: <6327573.Mj84IgUkQi@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Fri 16 Oct 13:41 PDT 2015, Arnd Bergmann wrote:

> The two newly added qcom ssbi pinctrl drivers have the same bug
> from a function name that apparently got changed in one place
> but not another, resulting in a build error when CONFIG_DEBUG_FS
> is disabled:
> 
> drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:652:14: error: 'pm8xxx_mpp_dbg_show' undeclared here (not in a function)
> 
> This fixes the two identifiers.

Sorry about this Arnd.

Jonas Gorski found this a few days ago and Linus picked it up today, so
it's in the pipe already.

Regards,
Bjorn
