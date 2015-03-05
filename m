From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] ARM: shmobile: ape6evm: Fix GPIO keys and wake-up
Date: Thu, 5 Mar 2015 09:34:33 +0900
Message-ID: <20150305003432.GA3011@verge.net.au>
References: <1425059319-13403-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38563 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179AbbCEAiu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2015 19:38:50 -0500
Content-Disposition: inline
In-Reply-To: <1425059319-13403-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org

On Fri, Feb 27, 2015 at 06:48:37PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds the missing pull-up bias configuration for the
> switches on the r8a73a4/ape6evm development board, and configures the
> custom switch as a wake-up source.
> 
> After this, the keys actually work, and the system can be resumed from
> s2ram by pressing the custom switch.
> 
> This depends functionally on "[PATCH 1/4] pinctrl: sh-pfc: Do not
> overwrite bias configuration" in the series "[PATCH 0/4] pinctrl:
> sh-pfc: Fix pin bias and cleanups" which I've just sent. But as this is
> DTS, it can be applied independently.
> 
> Thanks for your comments!

Hi Geert,

this seems fine to me. But I am reluctant to queue it up before the PFC
changes are accepted, lest there be some change in direction.

Please repost once the PFC changes have been accepted.
