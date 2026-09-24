Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023138F949
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242721; cv=none; b=AL72//7tmonrM95IRouacaYGgoz3rMmdfoWSs5x4buJ9K0LoY6d+7R8OSupWslPEUL/Ac4IowdZ5zaMZyYSlbpZiXS4WBjQCffp8yHjkkaf5bJ5sUcaf1/vF+HKVfT8382XaEW2NZ6+Ja8fWm0q1CmBicVeziiPcQbYO6HmD4yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242721; c=relaxed/simple;
	bh=gU+WI2i7LDEKT6RINnzIXgb5K5O4tS+U3cDvjUwa9t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFBBqeTyAQ2pA9Sn6jidZk7klsA9daHYS2PdWw3NlXL+goMEqPou49evP0Fhcupp2tmHk2FSEpcsnVWBb8zQFml9HnsOtDzb6OvepmKhYHNkr7UN/rKjF3I+ttQUfl7IdigmLPhg7HsCsV0wZW5C1SbaHrcY3JeSddkJSrTo6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so715493e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 02:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242718; x=1790847518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpeffu0mh4OhtQGcEkTfxWhGK7BSRsx5zqS/No2TWCY=;
        b=WotViUVzApsJ8wjAEpWYpBPcThpHZj9LRh6Fo/xBGks99ZxqxqCLSUoASwCwCKqKnN
         fD2XSBVoV/+eoyeMS0pcb7xdg7uOj4FMyytiww9HrVJ28OFsSqUetlBk7fCRqjw/bN5t
         +Rjkc7rdwabygJARBqzaV+VnIhIhdTPW3KNrgTeu1Golg0wK1kpzGaoM6R0wLQDPhZw0
         WGJ7F4g1NIkPcbMr5SvGlibDD19pc1JOgkbpoS8bSCjg5pP4thw2pk0Sa8YL7rhoCtFd
         2gZJE200A+2UoQNEmIxwF+/dp/TTzmwB+fX/hw4cIBlVxNxl40OPePxUMwCgexUb2xOa
         Xr/w==
X-Forwarded-Encrypted: i=1; AKwUvBxf2WOFXul9xixNw/tH+PvpuS50upbhts3eNRJpvqmxD1AaoYsTYFW7OqbA5zcdsjPKLu/rjIi2nJlg@vger.kernel.org
X-Gm-Message-State: AFuF++llzDO+VbpolKV9I5/68mr0wZjVWmxZzUwzdM81zw6AFbH+fZb9
	H+yEtN+MiF9a2q3Ea49TS6E0ryfQUczkkUFgemkitLwq+5hqzaW952k61XOMKKkrFBc=
X-Gm-Gg: AYBFou2PUGyqVAwH0NDPePy+aWFEP8oTBwByaZ6sk3IOd3csPnrEplnmO9x+33uibKn
	emni7SehG9uQFQFqFFZ39T6KW0nMgt0EQdN2j3OmBIOI9RRcyIR1rcwcnPlxqw1Cv8RpFcfb3kx
	zArCf5hG9uzLtbDUKJ6ykAS4eMfHsQY6C2v6gHBEl1l8Y3TcLOESTTTUkDVLzJPD8168kJ3T/s2
	A+qOR7g9cqd+RIdCaiHXLQAHuJW1vNu9mUE3bfilZU8bBQbxqmIBBv69nXbk9u08+vYn5pdSrrQ
	vVk3ksKu7/qw6DIHeHa1VtHY/Qd3PMKFnBoaP8cmRNE595sWFUNGgdcgP7CoVKRuFfn08jHYhwm
	2H+QlSQyT+zme0Die5QRuPZRxnNutOmPmqIrprxkZliW37qs+IzIiwCuG8WGuwAkc81DRStxdwj
	n6EKqT1tFUxruq0iKY6zNO2q//PP0h3MuD1HsKrFJ59dox0K1DglXIwRF+vP5m1krxj34aU8nAN
	6bltGdwf/w2AIN3Szh9tkjcznYznkMjGNP2KtVQoVcNhg4x
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7af1f0ffd39mr829831137.36.1790242718142;
        Thu, 24 Sep 2026 02:38:38 -0700 (PDT)
Received: from mail-ua2-f24.google.com (mail-ua2-f24.google.com. [74.125.226.216])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516a42fe6sm6074172241.7.2026.09.24.02.38.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:38:37 -0700 (PDT)
Received: by mail-ua2-f24.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe9so617375241.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 02:38:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlIHTXvSQdt+eUcMXU2p2lR3YRHmj7ERD/MAKCaJNjgBq20C2xWrenQ/CWZQpAxi1K/ooJ8sDJ7Zns@vger.kernel.org
X-Received: by 2002:a05:6102:524a:b0:7a7:12c0:f061 with SMTP id
 ada2fe7eead31-7af1cb979b6mr924094137.12.1790242717699; Thu, 24 Sep 2026
 02:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org> <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
 <CAD++jLmvZAen+p_Z-aVSqUnXMChAa7qbNvgv=mEQr9tFMiJFwQ@mail.gmail.com>
In-Reply-To: <CAD++jLmvZAen+p_Z-aVSqUnXMChAa7qbNvgv=mEQr9tFMiJFwQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 11:38:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe0vGnyT9E1abK5cFTJgA8=U4mMsaMJAFJsXCAcJf9qw@mail.gmail.com>
X-Gm-Features: AclHuK-4KFW8W7QHV9HlBHDtlVrNb0OLmBx3KedI1dCvkL0eI5l2kFSSP5LQI3w
Message-ID: <CAMuHMdWe0vGnyT9E1abK5cFTJgA8=U4mMsaMJAFJsXCAcJf9qw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: Linus Walleij <linusw@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 24 Sept 2026 at 09:25, Linus Walleij <linusw@kernel.org> wrote:
> On Tue, Sep 22, 2026 at 3:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
>
> > > +        power-source:
> > > +          description: I/O voltage in millivolts.
> > > +          enum: [ 1800, 3300 ]
> (...)
> > drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
> > for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
> > power-source property in the DT bindings until the driver is fixed.
>
> The DT bindings are used by U-Boot and BSD too, what if
> their drivers use it?

As this property controls voltage, I am mostly worried that having
a user without implementation may cause ill-effects (damage?) on the hardwa=
re.
With the property missing in the DT bindings, we at least get a
warning with dtbs_check.

Fabrizio: do you have access to the hardware?
Does it work? Perhaps the SDHI driver fails to probe due to the
unhandled property?

> It's a bit confusing but we're essentially maintaining the bindings
> for those other projects as well, and it's why, for a good reason,
> DT maintainers originally wanted to split out the bindings to a
> separate repo. (This didn't happen because nobody wants the
> job of driving and maintaining that, binding maintainers have
> enough trouble as it is.)

Sure.

> I'd say just apply the patch.

I can't seem to find registers to implement the voltage switching,
so perhaps it's purely controlled externally, and the property should
not be described at all?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
