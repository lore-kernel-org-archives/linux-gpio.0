Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222245EF33
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173654; cv=none; b=PyKjDebxnXeFCNQdVUyZkaJM/SF1MDBTNZYFGHLf/zBFkb+3pXqkG3y/IbnwkB8OwhDrq0J2rdFzh0hxEQSMHGcPDuqr+TDRe82h+nVbGuS48/1dOXYuVRc/67duugk1REZTPhKu5R6T/rpBCyHyoMtZB4M9QTS06Nuew2drfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173654; c=relaxed/simple;
	bh=vVZFr5F7cOOZct7lEDWKSVVaY32Ty0Af45luhb02r1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhFNaIrptm59UEuDf7BBDyDPpP0t8uMhJ0NCtG3jn0q8AIwe7bjtS0/1Ha3or8TZV5l7cOefcRkm2101lQE9+hoS3dgqFawoi1ao6cWBZsR3QeYOUfabIi+84jlOhqpgXPb5n5bHuKRivFm0Y+vcMWnw7EFj2Dgb/i8rq6sDA/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJssLEnW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJssLEnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FE51F000CD
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792173652;
	bh=/2S/xFdCH8ryPaYIhxOMdhFu1z0dJyvG3ZE20+H8y5Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QJssLEnWKLKNr6Sn5bJB7x/qVbceuxtYveYhOJHsAb1YrLE3lxKjdHHwuSiQihBfM
	 f2roKDHezjb5GRtkYqDkCNXqUcv/wNGiG1R8/IFt1Oxr4zfCClGFThmPkQil5Js6zR
	 hWRpgqbbvojgQM/NOlGp2Y4fL5sdTFxgzh/n+OzsZoCiAI14UrGsK+wzjVnE9bP+dg
	 lQBFvHAYS2c9sEiZSAxbNUcTwBlS7em/f+o7yWIkF05VbkLOZ/Ba1hfG7U0xvjmR5m
	 k5SlpAnhNrTiqxoJaBsd54s/XLcHvQ/KBQL24l+5hifAPYhIZGtdNJlQAW1MZ3YtRs
	 BMR/CcbUtIhAQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a87e23860cso3011131fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 11:00:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGbXnZOWodyxKlYBSZI+CNBQJIezmJjQH7SxGZRZDh5uXQuikeaKdbRr4j/xt2WWfGnNMaUuTpuaoZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKSIUtAc05AL3VI8i5XRbklkYjPbGMVNWo6XpNSdZuLMr1qqmbZ
	DK0X8CTOwmrxw4aKF0IXNIIDsHfhBXfqlczGObE0w86jXGTHO0qEsYArGtV+DIS26aG7yMF2WKN
	pTLWg5plsbVZdZiR74JmwEzMaSUbssYY=
X-Received: by 2002:a2e:bc29:0:b0:3a5:d31c:71a8 with SMTP id
 38308e7fff4ca-3ab1466ee7cmr8941811fa.3.1792173650943; Fri, 16 Oct 2026
 11:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com> <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com>
In-Reply-To: <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 20:00:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLn86Xuv++nMO7BT0spXaw5NFbU4jZfS7++NWkgy0OG5kQ@mail.gmail.com>
X-Gm-Features: AclHuK9TF9Po2M8_weOK0wk4TjqWjjDzjzoV8EgKl8xP3Mi3ZjQczn7NqB1e448
Message-ID: <CAD++jLn86Xuv++nMO7BT0spXaw5NFbU4jZfS7++NWkgy0OG5kQ@mail.gmail.com>
Subject: Re: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Vincent Fazio <vfazio@xes-inc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:21=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Provide gpioctl, a new command-line tool for persistent GPIO line control=
.
> Unlike gpioget and gpioset which release lines on exit, gpioctl holds
> requested lines in a background daemon so their state survives across
> multiple client invocations.
>
> The client auto-spawns the daemon on first use. Communication uses a
> per-user abstract Unix-domain socket, providing automatic cleanup and
> per-user isolation without filesystem artifacts.
>
> Each set of lines requested through the tool is assigned a unique ID and
> referred to as a "request". The following sub-commands are provided:
>
>   request      - Request a set of GPIO lines by offset or name. The daemo=
n
>                  holds them after the client exits.
>   release      - Release a previously made request by ID.
>   requests     - List all requests currently held by the daemon.
>   get          - Read values of requested lines.
>   set          - Set the output values of requested lines.
>   monitor      - Subscribe to edge events on a held request.
>   reconfigure  - Change the settings of a held request in-place without
>                  releasing it (e.g. switch direction, add edge detection)=
.
>
> There are also "hidden" sub-commands that are not documented in the help
> text but can be used for debugging purposes:
>
>   ping         - Verify the daemon is running (spawns it if not).
>   stop         - Ask the daemon to exit, releasing all held lines.
>   debug        - Run the daemon in the foreground with logging enabled.
>
> The wire protocol is intentionally private and unstable: only gpioctl
> itself speaks it, so no ABI commitment is made.
>
> Also add test-cases covering all sub-commands and configuration options.
> Update documentation, man page generation (main page plus one page per
> sub-command), and mark the persistent-daemon TODO item as complete.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

A big Acked-by: Linus Walleij <linusw@kernel.org> for the entire
idea and approach.

I can't claim to have read the code in any detail, because it
is quite a lot. I can run it through Sashiko if you want, hehe :D

I think this will be very helpful when doing automation using
different AI tools, but also for pretty elaborate scripting.

I think it will soon by itself develop support for scripting,
have you considered just integrating LUA? I was thinking
that it is very soon natural to ask for something like what
you can do at a U-Boot prompt.

request; sleep 0.1; ping; exit if no ping; get; if set get until low; ...
etc.

This kind of scritping engines are easy to build up in LUA...

My main thinking is to forestall any such scriptable feature
requests that will otherwise invariably appear.

Of course it is easy to call up the tool in separate
invocations, but that will have the overhead of executing
a binary, creating a process etc etc. With a scripting
language built into gpioctl you have no limits to what
you can do.

Yours,
Linus Walleij
