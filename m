From: =?UTF-8?Q?Andreas_Bofj=C3=A4ll?= <andreas@gazonk.org>
Subject: Re: [PATCH] gpio: f7188x: add GPIO support for F71869
Date: Mon, 19 Jan 2015 18:14:12 +0100 (CET)
Message-ID: <alpine.LNX.2.11.1501191807420.23468@gazonk.org>
References: <1419467255-9658-1-git-send-email-andreas@gazonk.org> <alpine.LNX.2.11.1501151810310.25141@gazonk.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-137090536-1389522943-1421687349=:23468"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foo.gazonk.org ([212.247.24.42]:59133 "HELO gazonk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751557AbbASROS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 19 Jan 2015 12:14:18 -0500
In-Reply-To: <alpine.LNX.2.11.1501151810310.25141@gazonk.org>
Content-ID: <alpine.LNX.2.11.1501191809160.23468@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---137090536-1389522943-1421687349=:23468
Content-Type: TEXT/PLAIN; CHARSET=UTF-8; FORMAT=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LNX.2.11.1501191809161.23468@gazonk.org>

Hi,

On Thu, 15 Jan 2015, Andreas Bofjäll wrote:

> On Thu, 25 Dec 2014, Andreas Bofjall wrote:
>
>> Add support for the GPIOs found on the Fintek SuperI/O chip F71869, such
>> as the one found on the Jetway JNF99-525 motherboard, to the f7188x gpio
>> driver.
>> 
>> Signed-off-by: Andreas Bofjall <andreas@gazonk.org>

Les Schaffer nicely noted the chip ID in the patch is not for the F71869 
(ID 0x0814) but for the F71869A (ID 0x1007). They differ somewhat in their 
pin configurations, so the patch as-is is broken. It worked for me on the 
JNF99-525 because the few registers that didn't match are for pins that 
aren't exposed.

Unfortunately, I don't have a F71869 to test with, so this patch 
shouldn't be merged. I'll see if the patch can be rewritten for 
the F71869A.

/Andreas
---137090536-1389522943-1421687349=:23468--
