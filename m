Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15E36C9EF
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545815; cv=none; b=FPmIJ80KAd1l/HFDNWrxAxMup0l0gS7J01vhgMWobgsg4dcrBS3Ba7Ossix1OHsmWip/RHqGV+3Pwpqdy9ZMAiycbb9YeTMv17jGf5UmRj3w+/e+/uDwdgvShy64VI39zVzBoWPwNjva4HLec0zk8b6ctYXQfcgNeoyHOtwr7Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545815; c=relaxed/simple;
	bh=RDYgonMLZZgBvRizzxm+UNJ3z8Y0vv51l3EtJhZlR0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=So0c1sroKTnq/vo7WUNtkmAbzYuB6Z4SueQS/hYK2tJpe0CbsWPSjRhlO7wk4X48suOJsqPJZyY/Mbkv9T76R58F9OTtUO0eYL+AWkTdCGgS1GpG4U0xlh6JFgH7+k/OBTkraLnYUig05/HGVg4pCoeA/nJ92Rq8zKwndoWfrbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ff1703cb9eso1445108137.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2026 05:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545811; x=1773150611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4n4UKmZ6iVKu4X1jPmC0GNiXXYHBrOv1cdLwQZ4FC0=;
        b=KutG9W+qp+QUPkuTcj0DZYlNuY7UqIpVp7FCYIPqY232OTikZPqfdpYWX69w1NVpl4
         6a23k7zi3toRTNsMU2uxxjzIf+fV9B0JTT7RViLnxysH3HgcAU/3Zr1X0QEUSqelvhSP
         8KL+l14ah5Bj+L/M/fN7/bkedA3XHvlGcAnK7n6PbCagz4foRKNJ1Jl2FSQ5IW4D81f7
         ZrzHX+U/owLiE8OFGuCYVGPvJtFwKXBjrE6viMuVtoE5vEEbQid66lIy0T+ISU9WKQXa
         527nGgPgbCcDsIV1c4CXpa/GQp2pHCRIyN3VR1umX4T2sjoQPUO/waKKxedbTl5rfOHn
         lhIw==
X-Forwarded-Encrypted: i=1; AJvYcCWiJD2aIbtsgflr1753qGtPplw0wX2efYm7PMGHLyRMNp5IIZ11yz3QrhNDCJnH28azNc4uRIsjB5+V@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpxFZ/RtGA5g0sj0GnUMhZxRpPU5cXoiQ9/cIjjhD/Fr8IT23
	JMp4W6dCTUdBlwyzvcPKv7jCF8Jd9fT0seraIcqqRiWTCy34yObUq/pr7m/3+qNr
X-Gm-Gg: ATEYQzzSNzN3PK9+WkZmMFXgnFVp0VqQxkav2OIWALnX0NShQHdE+KYGqhjcRt1hZ85
	sdknKL+UJ6xdg6RofgxjMg6Mmv/ugZXGz0cieRRjkn5K+C/NmNYHTRgSFuwtRvUmt/LdaTefoiw
	MveXB0qM5k50yUiRgbuzAOvWDkDj+U9rw6zoYJoAzK7e4qCILebHipoWR3nVsk5Zls4vao2EPJb
	9OXOoEU3Q/KX1nv5KJNZ+yTbswHRUCHkiHSCiny5E+c9i/2/NS+cKMn/rUHZPU2XKrsk0WNne5X
	PCajTmIc9Hl2KB715oYloT8OXg7+l4ChPOO13ZrnCt7awi6zzyvnCX5v/AKN9a7w9hhAw93t6yP
	KabnqwQZujgIZYfjgM/KweAfsGK2v5BZWqHtdLoLfnZhDkdTXxDjfUw3pjd0akjfKfz02KCSMPZ
	UzOx9xsPDzB7hS2nolv/jGrG1/RsjzL4jdCsFVm5MExF0/tZ8/cjwwZLTLoR4bWVrl
X-Received: by 2002:a05:6102:d8f:b0:5fe:13bc:f13a with SMTP id ada2fe7eead31-5ff32597916mr6074017137.36.1772545810739;
        Tue, 03 Mar 2026 05:50:10 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7af30asm16634840137.3.2026.03.03.05.50.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:50:10 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a94923c0aso1817556e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2026 05:50:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwQKz1bvVVL2wioPf/CmP2tNhWULT37sPmvZvsSCHXvWphD8MPyXO0c6oagMFtLsgnt0lLnNkm2FV/@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:5f5:2ab7:cef4 with SMTP id
 ada2fe7eead31-5ff323530c3mr5306088137.12.1772545810046; Tue, 03 Mar 2026
 05:50:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:49:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe2EXW7j7_Z9KSb1tYFbsEfC63HSvDBycdCYH4us2MDQ@mail.gmail.com>
X-Gm-Features: AaiRm5373kqYXoPI1qibK4QKFV_2fpSfHkF0McTh9iV8GZ-ZNcR_4rReTQoXHNw
Message-ID: <CAMuHMdXe2EXW7j7_Z9KSb1tYFbsEfC63HSvDBycdCYH4us2MDQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Feb 2026 at 11:40, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The rzt2h_gpio_get_direction() function is called from
> gpiod_get_direction(), which ends up being used within the __setup_irq()
> call stack when requesting an interrupt.
>
> __setup_irq() holds a raw_spinlock_t with IRQs disabled, which creates
> an atomic context. spinlock_t cannot be used within atomic context
> when PREEMPT_RT is enabled, since it may become a sleeping lock.
>
> An "[ BUG: Invalid wait context ]" splat is observed when running with
> CONFIG_PROVE_LOCKING enabled, describing exactly the aforementioned call
> stack.
>
> __setup_irq() needs to hold a raw_spinlock_t with IRQs disabled to
> serialize access against a concurrent hard interrupt.
>
> Switch to raw_spinlock_t to fix this.
>
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V2:
>  * reword commit message to better describe why
>    rzt2h_gpio_get_direction() needs to use raw_spinlock_t

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
