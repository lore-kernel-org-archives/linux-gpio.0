Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB05492E23
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396260; cv=none; b=TbxRUisgPceh5lwjxZNBNqqTmQfxfc30z/g7W3PJUfQ5L5ZE3BEnW/HTiHgF2hKs3pPwJZqxYCyrm/IA81b+dToSILYZ7kbWDy54r/O93ETVUuqpy9Kmi10EdLRjDCniozbRn/BMno2umwhqCtx5JHFRBdfuk7scNtuwfE8yXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396260; c=relaxed/simple;
	bh=Buh9i0THSDcejK/ymVQyIK051D+l1dSQlGlDH57S/1g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbUNIVBQfjig5GEYtJ+vnw0XebAnwt4V6b1PZuf5p5JidlqCrLICoDyxEo/4tqLTT/vu4Fe0LdMse8hip177ARc+ITJniRjZM8zHllz6GxkYCcZPH9D7eYdZABp9GseMVeFn9QsHNVSDP56a4trx+oxz7jVQ/BNUT56I+LQPKD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+8+e+gG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+8+e+gG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE6B1F000C6
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792396247;
	bh=DZr0A3Ez0KDSqlt2hbn5LmGwI02rUOJpn3pTSRVGyxM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=L+8+e+gGUiY2zFbLbb9HKArlPrBarHUgfclN4SFhkfeHYMPt5dUXUEn9lxfFx/qMx
	 BiYbO1NVXfxRgU4Tsd+nxIVEWHwJ8nEUTZiqH+jq096x4c6JM1ZQKNHhLz5f9vs2KH
	 KJI2sxgyocpl5EuNdm4KL1dcysgx2lJNhotCcvaTxkEKnHVdb0YtqaDJ5jy0tLp1XP
	 1UI+gcOxNRcqZeZ4Pw7ufvWhrEX+BTnGhf0y//wc9mjGiM9Tp5rG1cjuRH4tR3uTMa
	 Iu+78rqFNrFXDrCPGCxM/W1scuPOWCwHLHTv+qsqUquwZd2uP/Km7/Z0+xMgkubII4
	 AIYICVNGyLgtg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1571682e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 00:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgwE7k0ISkzGMDooGOoZOaA+6kA2LOxWilCQrWVknAdBgqJOHcwQzl3SFtVh6OFuBj6f/LYB4Mtk2U@vger.kernel.org
X-Gm-Message-State: AFq9FYLCxkDMZBHKCtCf3gKJHCqwHNI6aUR1NnAs0cqcCWC6WLTfnFE9
	pIW7MagZmXbeDMapQmVOU+kSSjPeGjhfiApuu9n+dN+dUMA1p8UDKyM6kUKymxePZ9/sowmjCyb
	SzQFLa52ZsuKGAw1omGsCKfaJh8YbO1db4ZuVF0BW2Q==
X-Received: by 2002:a05:6512:31d2:b0:5b6:183c:5ca2 with SMTP id
 2adb3069b0e04-5be50a84a72mr2245105e87.64.1792396245512; Mon, 19 Oct 2026
 00:50:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 03:50:43 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 03:50:43 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLn86Xuv++nMO7BT0spXaw5NFbU4jZfS7++NWkgy0OG5kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
 <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com> <CAD++jLn86Xuv++nMO7BT0spXaw5NFbU4jZfS7++NWkgy0OG5kQ@mail.gmail.com>
Date: Mon, 19 Oct 2026 03:50:43 -0400
X-Gmail-Original-Message-ID: <CAMRc=MetK8sUPB0TAyJzvhNR2XZBXZpVzHeMuXxip56fQaodMQ@mail.gmail.com>
X-Gm-Features: AclHuK_zc7YZRfnDgilIlt6sKsCoCw5e3x9QAxZvZmqv1kR0bJYXlZr6RY7F7d8
Message-ID: <CAMRc=MetK8sUPB0TAyJzvhNR2XZBXZpVzHeMuXxip56fQaodMQ@mail.gmail.com>
Subject: Re: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Vincent Fazio <vfazio@xes-inc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Oct 2026 20:00:38 +0200, Linus Walleij <linusw@kernel.org> said:
> On Fri, Oct 16, 2026 at 4:21=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>> Provide gpioctl, a new command-line tool for persistent GPIO line contro=
l.
>> Unlike gpioget and gpioset which release lines on exit, gpioctl holds
>> requested lines in a background daemon so their state survives across
>> multiple client invocations.
>>
>> The client auto-spawns the daemon on first use. Communication uses a
>> per-user abstract Unix-domain socket, providing automatic cleanup and
>> per-user isolation without filesystem artifacts.
>>
>> Each set of lines requested through the tool is assigned a unique ID and
>> referred to as a "request". The following sub-commands are provided:
>>
>>   request      - Request a set of GPIO lines by offset or name. The daem=
on
>>                  holds them after the client exits.
>>   release      - Release a previously made request by ID.
>>   requests     - List all requests currently held by the daemon.
>>   get          - Read values of requested lines.
>>   set          - Set the output values of requested lines.
>>   monitor      - Subscribe to edge events on a held request.
>>   reconfigure  - Change the settings of a held request in-place without
>>                  releasing it (e.g. switch direction, add edge detection=
).
>>
>> There are also "hidden" sub-commands that are not documented in the help
>> text but can be used for debugging purposes:
>>
>>   ping         - Verify the daemon is running (spawns it if not).
>>   stop         - Ask the daemon to exit, releasing all held lines.
>>   debug        - Run the daemon in the foreground with logging enabled.
>>
>> The wire protocol is intentionally private and unstable: only gpioctl
>> itself speaks it, so no ABI commitment is made.
>>
>> Also add test-cases covering all sub-commands and configuration options.
>> Update documentation, man page generation (main page plus one page per
>> sub-command), and mark the persistent-daemon TODO item as complete.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>
> A big Acked-by: Linus Walleij <linusw@kernel.org> for the entire
> idea and approach.
>
> I can't claim to have read the code in any detail, because it
> is quite a lot. I can run it through Sashiko if you want, hehe :D
>

Can we do this with non-kernel code? Or are you running the model locally?
Because in any case: absolutely please do and share the results!

> I think this will be very helpful when doing automation using
> different AI tools, but also for pretty elaborate scripting.
>

It is mostly for scripting TBH. I figured this is the closest we'll get to
seamless peristence of GPIO state. It works kind of like the DBus daemon mi=
nus
DBus.

> I think it will soon by itself develop support for scripting,
> have you considered just integrating LUA? I was thinking
> that it is very soon natural to ask for something like what
> you can do at a U-Boot prompt.
>

Like what gpioset already has with interactive mode? :)

> request; sleep 0.1; ping; exit if no ping; get; if set get until low; ...
> etc.
>
> This kind of scritping engines are easy to build up in LUA...
>

No, not really. If you need to do this from a single process, just use pyth=
on.
Or maybe someone will write lua bindings some day. I don't really plan on d=
oing
anything like this myself and this program is likely the final big developm=
ent
for libgpiod. Once that lands, I will consider the project mostly complete.

> My main thinking is to forestall any such scriptable feature
> requests that will otherwise invariably appear.
>
> Of course it is easy to call up the tool in separate
> invocations, but that will have the overhead of executing
> a binary, creating a process etc etc. With a scripting
> language built into gpioctl you have no limits to what
> you can do.
>

Yeah, like I said: thanks to Vincent's work, the python bindings are in gre=
at
shape and always up to date with current developments in the python world.

I don't think stuffing lua into gpio-tools makes much sense for what it's b=
eing
used for.

Bart
