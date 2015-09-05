From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Sat, 5 Sep 2015 09:43:56 +0200
Message-ID: <20150905094356.6e6588ef@x2>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
	<7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
	<20150821175216.GE1729@kw.sim.vm.gnt>
	<20150821224824.3406caa0@x2>
	<20150904134853.GA24722@ns3274321.ip-5-39-88.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38743 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbbIEHmc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2015 03:42:32 -0400
Received: by wiclk2 with SMTP id lk2so37105720wic.1
        for <linux-gpio@vger.kernel.org>; Sat, 05 Sep 2015 00:42:31 -0700 (PDT)
In-Reply-To: <20150904134853.GA24722@ns3274321.ip-5-39-88.eu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>, linux-gpio@vger.kernel.org, Yoann Sculo <yoann@sculo.fr>

Hi Vincent,

On Fri, 4 Sep 2015 15:48:54 +0200, Vincent Donnefort
<vdonnefort@gmail.com> wrote:
> ... I let the loop running during several minutes without having any error.
> Let me know if these commands are enough for you to reproduce the issue.

Did you also have gpio-input-polled active on another pin on the same
chip ?

Regards,
-- 
Vincent Pelletier
