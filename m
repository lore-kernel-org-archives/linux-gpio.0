From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Sat, 12 Sep 2015 15:26:43 +0200
Message-ID: <20150912152643.4e5bb384@x2>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
	<7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
	<20150821175216.GE1729@kw.sim.vm.gnt>
	<20150821224824.3406caa0@x2>
	<20150903200540.399a96b8@x2>
	<20150909220140.GD9892@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:35864 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754720AbbILN0r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2015 09:26:47 -0400
In-Reply-To: <20150909220140.GD9892@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>

Hello Simon,

On Thu, 10 Sep 2015 00:01:40 +0200, Simon Guinot
<simon.guinot@sequanux.org> wrote:
> Vincent (Donnefort) finally succeeds to reproduce the issue. The setup
> is quite simple. You only have to flood the gpio-f7188x driver via the
> sysfs GPIO interface. Nothing more is needed.
> 
> After some debugging we discovered that the problem comes from the
> __request_region function which don't handle very well concurrent
> requests on a muxed region.
> 
> I will send a patch as a reply to this email. Please, can you test it ?

I reverted my mutex-adding commit, applied given patch, and could not
reproduce the error after a few minutes with my test-case, so I think
this solves the issue.

Tested-by: Vincent Pelletier <plr.vincent@gmail.com>


I rebased my others gpio patches, unrelated to this issue:

gpio: gpio-f7188x: Implement get_direction.
gpio: gpio-f7188x: "get" should retrieve sensed level when available.
gpio: gpio-f7188x: GPIO bank 0 bit 0 is not available on f71869a

Should I resend ?
I have not checked other model's datasheets, FWIW.

Regards,
-- 
Vincent Pelletier
