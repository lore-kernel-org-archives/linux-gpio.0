Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6B4CE677
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499360; cv=none; b=OdVTf6Ab4+hR98gtiYk5065zyl88vqKnwEbAf3J/ysTe6UGurJCvSFwGhWEnwauOhlcDYdvAvUZzvg44QqMprHXtp6dBcHuCOyM8vKRUZKmqx1hWmBfCXF0M3epWTyr+vCedL99OqM786JGmjm0Hv4ugiEg+toAdViEns6sMgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499360; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnIAgyP1zJWwMh+oASX7eBNLG2/uXWWdbsJ3eWkPmftfkCcgZ2LdPrlJ+L63lYr/96dpt5Ap2H1iwqcqmox3XRJ2x17anLsmoaQadw2fIafBZ9aAdqAuedwbPFSqMa/FDibQka4yomUPIKUwHGnqbNivGhuHVozmesnQbGJsH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CSrtt9Un; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CSrtt9Un"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso241475a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 12:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499357; x=1790104157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=CSrtt9Unpbm2RA3J8D1Piu8PqBvT7/aa/KZ5CE3c3D++Q65F+8LC8PQhJ+YAQkLRZF
         FOCbEfcedihMauvO8i4QEZYDfsgCMc/AU6Y/5BuRF/k4i643ZbHqsUyNas20hZQzkd2E
         0RZUaMtkje/C5faG2xlXImdyEwn4T014v7tJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499357; x=1790104157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=hMOrbSSomZ7NVyeaCwC5KG9MvDMm6/IOLvlbvLl5X8Ph/CAHFv92GhcP4kuStYBKji
         VoR6rUTy/vn96mPYSR8/Ey2rwNlMiVgoXUwQolBbSMxDuYt3L63uIT7MLvCHUL/1euvT
         0cMMpDWafUW9W4jnpcE0M+ir6X+LVkT1cEi/NF35xxs9rwh9ku/bsAgBMAsiRVqxQE0t
         sTP+Gdj/yQkMxQc0/E9nw1y/1HkLYnnn/kiUCg6uSmYoTGmmT5nLJSGrO8tqrw74fZxY
         cbmOhRxAfoXLfifWGGuV9zGROYC3o5qiz+ci7zgteic3TlCqXg/VEmNxbwyfV5QptByl
         bn9g==
X-Forwarded-Encrypted: i=1; AKwUvBzH7qrAYly74q69BHMZWrSSbQ2buuYP+nVkwxpuLfZksUelRat51edAhU5gY/EcKqkLaUr3EiZ0Erho@vger.kernel.org
X-Gm-Message-State: AFuF++m6IDcpxiYvS4aQN+SYdJiN8fO4hdlrZUhJzQtMKzli7kORM3X0
	puNjLCykTzvPnvKZ5JuH1HQeg1Zg3wD6Z9WgDU0vtIf7iw0FgYRi6OBbDXN5OeWazFzHm7kXGvU
	1ozUq7rc=
X-Gm-Gg: AYBFou3T1N9pLVWEwWoV7tG3j/o6pgzmQUt8qkebi3aBi9/ZC31HITkn6pHQGMkqY1b
	Okv8T/SnZQ9J4wPlHpA6N+BCTTTUnlZp3bSXl64c3NxqxJkQpZciBbQ+9Jj2MTEyRHCIHo+Fv5O
	liE2eVdkTnXvcnsIzcnVJwPEXg802yhrf+geba7UOPzFJ7mGpz08owz759C3njGOy95kx7h9TM3
	VHrcx4qFJpy503+JRZr7Gjtmm/1fBD2T6CVohKhRxxjynNazz48urH+PfClOV2gYvyme9DHmj07
	gl49b9m3JAOMjHIC2fEe2cbWM8GQswUoamqLfuB9EACULGcO8yvVzyzXuZU6oRdIexFCr0WM39t
	+yHMf+Y9W6ZBavpERKUVhS0Ji34mQf/QbbaSKICuRNEekdrpXa0OA+LOINiS8BeTAdJrBRxUCxZ
	nHcsKn0zPP1bZFelwyv/Xd7HvlxsImN9TPUSRHKF85xf1SfUQ1Rk8t4fGrceHiJ/o2w2NI2mSKs
	5KRpUSw3B2rHHUduvHU1wGhaI3xa7lccVm2FR/5486kt9b8cw==
X-Received: by 2002:a05:6402:2709:b0:6a9:d0f0:69a0 with SMTP id 4fb4d7f45d1cf-6a9f6257017mr9995912a12.11.1789499356859;
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad11sm145048a12.22.2026.09.15.12.09.15
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c2so22197766b.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 12:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywt+ww2l+6VexMXMz499z54lKmDT+uFZ1I399MJ3MarXkb5SUTwJ0cP3aCQWhol5Gpo55rs92zM1lh@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
