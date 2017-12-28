From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH 0/3] Change ISA_BUS_API dependency to selection
Date: Thu, 28 Dec 2017 23:53:33 +0100
Message-ID: <1d23ba1e-6cf9-11b7-2fb2-879fd35ed881@maciej.szmigiero.name>
References: <cover.1514475654.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:50138 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751112AbdL1Wxg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Dec 2017 17:53:36 -0500
In-Reply-To: <cover.1514475654.git.vilhelm.gray@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

On 28.12.2017 17:01, William Breathitt Gray wrote:
(..)
> 
> Linus, please pickup this entire patchset through your GPIO subsystem
> tree; a recursive dependency error is present if these patches are
> cherry-picked (see https://lkml.org/lkml/2017/12/26/235), so they should
> be merged together in the same tree.
> 
> Maciej, this patchset resolves the recursive dependency issue you
> encountered, so now you should be able to submit your Winbond GPIO
> driver with the ISA_BUS_API selection as desired.

Thanks for these patches, will submit the driver as soon as I
integrate Andy's comments.

Maciej
