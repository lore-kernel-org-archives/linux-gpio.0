From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Fri, 4 Sep 2015 15:48:54 +0200
Message-ID: <20150904134853.GA24722@ns3274321.ip-5-39-88.eu>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
 <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
 <20150821175216.GE1729@kw.sim.vm.gnt>
 <20150821224824.3406caa0@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:35980 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933296AbbIDNs5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2015 09:48:57 -0400
Received: by wibz8 with SMTP id z8so18389074wib.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2015 06:48:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150821224824.3406caa0@x2>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>, linux-gpio@vger.kernel.org, Yoann Sculo <yoann@sculo.fr>

Hi Vincent.

I'm working with Simon and I'm trying to reproduce the error you
encountered with the f7188x driver.

On Fri, Aug 21, 2015 at 10:48:24PM +0200, Vincent Pelletier wrote:
> Hello Simon,
> 
> Thanks for reviewing my patch.
> 
> On Fri, 21 Aug 2015 19:52:16 +0200, Simon Guinot
> <simon.guinot@sequanux.org> wrote:
> > IMHO, understand *clearly* the issue could be a good start in order to
> > fix it efficiently.
> 
> I totally agree, but have no idea how to debug further.
> Could you suggest any mechanism to debug *_resource ?
> 
> > Please, could you describe a setup (as simple as possible) allowing to
> > reproduce the issue ? I'll try it on my side.
> [...]
> > Please try to make the module list needed to reproduce the issue as
> > short as possible. Ideally only gpio_f7188x would be needed.
> 
> The simplest I could find so far needs gpio-input-polled with 20ms
> polling period (I didn't try to change polling period), and a shell loop
> writing to gpioXX/value.
> 
> I'm using the following platform driver to declare a single
> gpio-input-polled key:
>   https://github.com/vpelletier/linux/blob/free_nonexistent_resource/drivers/platform/x86/qnap-tsx51.c
> Full version of this driver:
>   https://github.com/vpelletier/linux/blob/ts651/drivers/platform/x86/qnap-tsx51.c
>   (ignore code surrounded with '#if QNAP_TSX51_GPIOD', it is
>   still broken).
> 
> It should be easy to create a variant fitting another board, as long
> as you can recycle two GPIOs.
> 
> Once I've unloaded all other listed drivers for this chip and loaded
> the stripped-down qnap-tsx51 version:
> Terminal 0:
>   echo 0 > /sys/devices/system/cpu/cpu1/online
> Terminal 1:
>   cd /sys/class/gpio/
>   echo 62 > export
>   cd gpio62
>   echo "out" > direction
>   while :; echo 0 > value; echo 1 > value; done
> No error so far.
> Terminal 1:
>   echo 1 > /sys/devices/cpu/cpu1/online
> After a few (10 to 30) seconds, tty is flooded with the error I
> reported.
> 
> Stopping the loop stop the error.
> I have seen rare cases where a few extra messages could occur within
> the next minute or so, but this was before I stripped most out of the
> platform driver.
> 

I didn't manage to see the error you were talking about. To
make sure I understood correctly your previous e-mail and since I saw
some problems with commands you gave, here's what I tested on a
4.2-rc7:

$ echo 62 > /sys/class/gpio/export
$ cd /sys/class/gpio/gpio62
$ while true;do echo 0 > value; echo 1 > value; done

... I let the loop running during several minutes without having any error.
Let me know if these commands are enough for you to reproduce the issue.

I also tried as you, to remove/add CPUs but it didn't triggered
anything more.

$ for i in $(seq 1 3); do echo 0 > /sys/devices/system/cpu/cpu$i/online; done
$ echo 1 > /sys/devices/system/cpu/cpu1/online

The last thing I tested is to perform SuperI/O access through the
hmon driver while running the gpio loop. But once again no problem
appeared.

> With just two such loops poking at (out) GPIOs, it does not happen.
> 
> I'm testing this on v4.1.4 with the following patch applied (the error
> happened before and after that patch, so it likely does not matter):
>   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=7e08117de6ee17ae6c8f2983999a98cb95eb9bc2
> 
> CPU is an intel celeron J1800, dual-core at 2.41GHz.
> Exact board is this machine's motherboard:
>   https://www.qnap.com/i/fr/product/model.php?II=144
> 
> > Unfortunately the f71882fg and f71889f Super-I/Os don't provide an
> > I/O region dedicated to GPIOs. If it was the case, I would have used
> > this way. But for this Super-I/O models, the GPIOs have to be configured
> > through the global registers. That's why your patch breaks support with
> > this models.
> 
> Wow, I didn't expect such difference between models otherwise handled
> the same way in hwmon/f71882fg.c . I guess the GPIO function works
> differently from hwmon function in these models (hwmon still having
> dedicated IO range, not GPIO).
> 
> Regards,
> -- 
> Vincent Pelletier
