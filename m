From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] pch_gpio: set value before enabling output direction
Date: Mon, 07 Apr 2014 12:16:06 +0200
Message-ID: <199580560.4VsyQBobOE@ws-stein>
References: <1395739967-8465-1-git-send-email-alexander.stein@systec-electronic.com> <CACRpkdZVwKtXVhrT2f-t8Y4VwoOkVCfuJJCVbbE0A4f0Nv3frA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:42166 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753510AbaDGKRS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 06:17:18 -0400
In-Reply-To: <CACRpkdZVwKtXVhrT2f-t8Y4VwoOkVCfuJJCVbbE0A4f0Nv3frA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Krueger <daniel.krueger@systec-electronic.com>

Hello Linus,

On Thursday 27 March 2014 10:22:40, Linus Walleij wrote:
> On Tue, Mar 25, 2014 at 10:32 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
> 
> > From: Daniel Krueger <daniel.krueger@systec-electronic.com>
> >
> > This ensures that the output signal does not toggle if set to high.
> >
> > Signed-off-by: Daniel Krueger <daniel.krueger@systec-electronic.com>
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> 
> Patch applied,
> 
> Alexander, would you consider doing a patch adding yourself
> as maintainer of this driver in the MAINTAINERS file?

Thanks for offering this. I'm inclined to this, but the problem ist I won't have
good or even permanent access to this hardware :( So I have to decline.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082

