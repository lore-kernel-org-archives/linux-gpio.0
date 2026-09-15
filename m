Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126842903F
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488515; cv=none; b=IPStyGXG0kCdzZvZWcym+Gn7ti3u86ZUudCM6A8wtXIKPrnQXs/SyE7+APJpWUg0Z7YTBL3pnuqoWl/JyIS8eS5/t2zNPt2bhaRsx6G4IwH6s/48/2mUI7bzkYtqgySKUPlEEXtApKzukDBzIyY3htAEu3Lg1aiS9Jc8l9HCg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488515; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3wQZPdf6Ic0q9Z6woysZJ25ngpdV1t060d69aGyOwpvwpvLgZV9BgHoZbq3MH7iidfaHOZj1VbF8p7fVQoBkN16u/1oC53Vf8zPXt/hbICJ3IwAwL5KAc8hrv8SP5eD/bQgsLIpBCrD9/xVoBgBkfHnpIBbS/adqDDGeETKWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JMXMJ7Wz; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JMXMJ7Wz"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so6088086a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488511; x=1790093311; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=JMXMJ7Wzb5FaEQXPC5nAKVQ36VZxGfd5tzCjMsAwROJp055WyMxsG8m9Dz6y87FZnr
         qLhvtimd3gN2dXT2VgHUTPVBufSxy9w5qkwfUhbqrFEHIU5ChArtzxL9tH41b12C1bkL
         mMEiOQ4SD6nyXmOCoi3LsBXsq5MJNEn7qjgJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488511; x=1790093311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=R+fOfqRLHCdBs1O3CzBZm8hW+/owFrkbnuV9/rliKtd97A3yQH3TE8eDX04TcRA2ik
         u+kXZlY7NOIXe61L261mZAoJjOECy+5e7iqS4ZX8yHWOm7S6xP2xLI98oydZiECFveuI
         XqmvaZjcVikVrutkCpFKDLb+G7zNKjyg9tEcKoH37GlwGriUyfhhUqGZXamBj+5ckVge
         xc1aZGHZ84NjPcxo5iTHqPvKiXGNEsnoejvgfTj28dd2hQ4e22QXGDkIQBEoZwVpZoAx
         RiksA8g4k5A342AGzQOHAL6aqQxsWFN5VvIiJzK2h1re2Eab+agM1B7/W9MoAAsikrXg
         EkBg==
X-Forwarded-Encrypted: i=1; AKwUvBzTWaowxofbKl9lPpFSKEPAU1lchs/cqH/LJwiUhsxRyTz4OQU5bk2WlKRRnzyiNzCpM2F5n61IrKZH@vger.kernel.org
X-Gm-Message-State: AFuF++naA/qU20xQCkZiWNjUeAkvd5UTwXVTHCBSr4NasDFiIEbtPcsY
	EBY0WdOUXB6MsA1PKZlCEfqnDkkVgO+xctEY6F5W/LoYRoEz+clHOX6a2HB0hG6n6TI9OWwnZb2
	UHO+X3F0=
X-Gm-Gg: AYBFou1mxdUbhX4AF2Wforn1wRt4759/JLZ9m/Xu0GuLMroQotub/Ev5TIofpXeT98z
	38padfbo1km7KPOKt4PtOTLP/VdcpOyB4FcI5BrtX5joPDJzeR4I9exkBQpDD1vM68iPThW1FUa
	ZSQ+MXzQEGqbEKUJkLU5jK/Qe/sWjNwKjP15l+4JnDIR4bpKNszICVWyBjBWj+CA/JEq0AIXqnf
	XtUcE2PhhPQ2EjRJR6TMh+KPF4MoZCDX2mXUxnOnOMB1Jk9L5x6IDySaeh+qkQD55H10fxD0sTQ
	mvsbU8BIlgHogotceqz8olXCW6iI7CHMI/n8sDhg1ZoxHlGNvfzbRk0ma5coqibTVebHCmLLT4d
	2qjGATJHrBlzpkMjAs5gGsSLSiKAGzuaTEfUXMYn2vvrhPCgV375Xp80Ver8wFa8qRYZj2POuD3
	lM5Mj5J2C6c6CCc4UcHzyXEiR9E9XEZ0TQxmIKIHbxkeTnp8bjwKTLSuUZsQ1R47ntm7AyNbnpA
	KHczY7G7rK05d6qsJWLHwg1Bfieg05kTsP/ImNWERS9Uy2R8kI=
X-Received: by 2002:a17:907:ea91:b0:c26:19de:9ac3 with SMTP id a640c23a62f3a-c29b86f8fb0mr538912466b.27.1789488511256;
        Tue, 15 Sep 2026 09:08:31 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453e23sm1546266b.14.2026.09.15.09.08.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:08:31 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so503186466b.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:08:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRHy2IwsYgQBAoxuW6NRm0uoxW5kz2BYsrvOB3kg4r8C9H7mvQFwrHu4V3bUqDfMk87pdKbFDm6jR6@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
