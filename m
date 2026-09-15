Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850CB4399CC
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494730; cv=pass; b=c9D3mfSqQskizecW+tEd7k9flmzpETZmy0BU5nb9nXGKfw1iMJj4fUwfE0JDtPk79UJu0hMFCCl4cUu4yxvy/ycjtCFPTclY3o/UwM8cJ5adBW2nhCZzc3cHH9d2XlplU1j16taUOXF5JUMEpDMXaS0xydQcatO6lIiBP4EoDz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494730; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlrROPOaIf6ZNk0DuYf8hNbE7XUmPsEs3+frc/PPPWqLjszXAF67lPl7TKmiEJ7ERaVpyBu2eMBVfjKjUFjO+zdtmgi1HTZE8k8G7b/AGcjbEgizgyqIL0AZx9dbrbwgeGqMaakQ+qeo6XHu4e91cIczmEX6YLwm+4Zr6z93lGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so6895ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=KsGyYyczKFO3pqgBTpo8q8EZmHMB9N0QfWSH/BYOwjgXqtcrIDKEYTrrJ7CUkug1CH
         m7nnJ8Grh2mQM/k0LkHrMOoOBp1ShEUNnFw7lcH0MFtSWQS7woOj/g12sSk5pgGz/WAX
         S4ODMhEyfv9aqrRNj1ShzuYEnxhp9uNSYAV7q6NCcw0Un6KftuFUlUeA7E9W7O0CHoMz
         xj7owGdTEUgyDAkIeBJ6TDvyIcwqR9Taj706mrZJ2QbCPYMO4nYy7AKoWODIcxbkNePY
         +AJH8bc/n1KEVhGoDJfF/3BwV/E/yqQIF4DXaczm4VGVsZhPlJAu9R5Fc6wsKUUUSIyj
         tA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=uk7KjuH3Kqz8UjFZon87ZDt34A3XX0pqMUZ0I7JSLU0=;
        b=GuPOEsdk8TOiVbIpvVhuFqZviEIsWc45BjXv13gAg/XG1j73j9SM09vaSCLhhLFfco
         E9GOqP9EDAOO8aKHTJjoISfEyNfkxDtfyvLUusnsXIf7ZH1Mm6R4ARhGI34mNWM4Nxjc
         MJFE3kZBPXN4vEGIr46J72oMhQc24GmKbOM6NsqfggCyb01LRuFxVzekoMeYpjcAMOrw
         n5D8Hs0KokAQH+/FhOsZWslnTZVeyren7wvuivfPfmVAF+oWaPlRgGojcHdezwv/elpW
         aM8hLqMAOZQPwr+VuJXx9Ng3iEdSKUw1EM6zh2w4zy86khHVAU9mvPM5lkd7elNxE/fB
         NhYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=CGfdb7EgYo2ydztK5ZaSFXtGbbwFrys8Q2skco8Z0IA6mshqHtvzcjwPoFi6LN9hiB
         k4jSqsoJdSGYuupWj6zjnsbVU3kZs19Uus81/dsURBQLMUfgXzz2j4mhhn6fj0CDDX6b
         qQB8IqXZ0gANvcRSqqbUKXU1rQtkpGxfLctej8hMMdvGU32DO8da3Y8wQZ6s8qXCb2Mj
         DwyeUySHbglUbZPzzHNoaeqsv8EDSXin/g2MayE0ryh+G7BfcLQOWZd4L6W4Ctmn67O3
         3ZuTiD+Hj7jsymCX0q4waYeGrd+tAo73CtoN4H9t6KNDzLQw+EgSSKh5rj2trALi7BDj
         3iIg==
X-Forwarded-Encrypted: i=1; AKwUvBzNOP+5PNyjpaI8RukGf9snTXeh49ar7p3j2qCodhJ2hWGOCfWgN1jqQOnkC1BQVGK6H0Vyz4ilh/kJ@vger.kernel.org
X-Gm-Message-State: AFuF++k1CNmuEh9IZiZaVvPLOZ1SDINxxm4e5936ExpYRJv40aB/Ix2H
	6K+kOAyKPi0f5Z7wvWBLrC2DkpH0UjQ7YP9Zp4uIUyniRi0ab5e5L0h2vZtvWmosdjzJdlnfBvl
	fsPGNhLq2eImXcA08G3WQ5gK3tn/PstHnNZSb45/Q
X-Gm-Gg: AYBFou3JuIsxwTAG7qmR50XjqutYjbfP5qiCNmlK7NoeisWdoHPl0j3OObqaDWhUOmH
	fln+nHHRVINafsu77HoWf4xHib8XHXOA2kKSd2b0lVLn1WzwoM1DiK9OrwMGMnYTb1SE2Xje9n8
	cYZ0dh2R9jpxlG2/P9EOE4gE8Z7d0yCzZCEJBBPzntH0V2y4EwSgxnwf+hI3bjDVvuEIa0WoMpJ
	VsoN1V1RJL1bvx4Zz01pzrdBholTfx/HwBTyGSnIsQ2KTWgSWM6KWiwAhj1vPi4gVSKVhldxvLV
	aqnt5CyrpKyfaBHS3l8O6PufG0H3P4Y0lU1wsKNdGQw9dA6ltYFf+co+AhBVbmcGL+5rzJwkdo5
	rVIihbO3Z0TFtD2UH2vA0qWfkaYEwazEJUDtPhykxL7JYrHxCW6Y=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
