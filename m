Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8B35DA6F
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779032885; cv=pass; b=ecgbUC2HAtF/yS40tlQBlx4BocoAyZKtcjgSyGI+0MNZv0CFKZTErHC858GDRxG7KFaJWazBrv1j8WXOLeM+3MfcyBjV818nqHN7JlX6ReOcqVnA82icD+clgXOsiXAs2kwbAHYALIkHRZPL1qmLd278y49dSvyDZ9Y5Xp4K+GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779032885; c=relaxed/simple;
	bh=qGZ1HqlBjsy/DoLZhVKAYmOAs/Q65t2C3IrJXW3pZ/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tnw5DszYVAsGIl0L0U4yuQyzeA2LDEPFOS3VMD4p5oYSWdrOpI4zUCHIhtKJsCX0H1g5xEPfFtjswyIQevaSAYvXnCNbwvBouJzTsoGzuqIyJRBRiYViIy/fOC9RQfp8lpzr/++hmCBQcajMToKzAcivIQvzY079P7wE4SPdgic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBVLuWmq; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBVLuWmq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd36614d329so219446166b.3
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 08:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032882; cv=none;
        d=google.com; s=arc-20240605;
        b=YOdXyPl3cxzN0C2DhdDpiHa/G9bN/KxKCzJTb95/w3BbEJzNvzvFy6jHCOp90qoWVB
         IrwEvYLfdsuST8p/1Vgc8i+lFlkp1UUn6c7NYwsD3KwQZ/VzGqBpkECB/7AsqB2MjPBd
         ROfp1BNzVdtKPeYjYr2KUMwaY4xZM1SbL2TLXWWoGIiecRFgT7HOTJLuLk3GfhkUlMhU
         Im8i6bu5Q9NI+37mTkFGlfagl1VCimYCDm88o0xQ8Kiv+fqHyiEI1M4loKc6Wnxk1aKN
         HTzR6VxOIf8tzTyYrP17J+gz3nSOdzbtDmPtT4Fl/P03VxjtE7vKBBV1W4fx1rkew6Wk
         4dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6r9pXjllAGW/zCF4klcUwbH8t5FkwhSzOd7sQUECwE=;
        fh=LN9JXMNy6ASdU1AulMmTABwTI0We9uG0k7/qyrLzUdo=;
        b=Mpb7+d8JJje9M88iA7bkVXtTDJmqoAP+x0JJpmDORDn6Y6Bv1oWc4fx8bzm19KYCtV
         sl7HCQVzbpEs8oFOBv/Z7ql/E81Vni4vHyMWmvo7qQc90zdxSS65S2GI7Cs0dPu766l0
         FZ6hXjHx8LutqVqNP1EGR1wX1v5Tbr3cdMjYn2GrT8QGXJt1XG0BLLNWKuOqbUsgCNxD
         0CXBEbOfI6SI7jTKRrmAFO9D5haXCk0vNZEm1OkvS32aQXqejbYsJOb19eOHUH/kNbI1
         ypel8I04hwWb5uXw/OEPG3gZz6N3oBmrrYzlABTxzEJGutMiSz5plqdbtX7IuUmFnHvS
         fVEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779032882; x=1779637682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6r9pXjllAGW/zCF4klcUwbH8t5FkwhSzOd7sQUECwE=;
        b=CBVLuWmqEbQuiaGT5XFHml15kDelpKmyhrKuKbVwuWQ2pJ9Mp42TZF5zJZfOZD2YVN
         rkJna27R1ByEsCGpihHtaasHTpmBvhNDJt8Chg/pjo6dyB2CV4CX59dMq61qawTxodHZ
         KOdIhvL8o+K56WqAq5/Ui/h537jFGFBsIhghpjx/1pXNrVkygswtYEk4sXQKwK9lDaUH
         iqJBjLdbd1kh5tFXNr2M8j2rGl3gK32eYQF9KSrdc41qGZDs3RLeTBURLh1S4lwzTBXs
         1Cwzx1Xo96VQBVkQjKxqlCEjvO4F2THcweRi2/6B26Nq4Qdlf02i3aGEj4sj9HtgY9nT
         jHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032882; x=1779637682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w6r9pXjllAGW/zCF4klcUwbH8t5FkwhSzOd7sQUECwE=;
        b=srcdcAh2cWFHu/glX+jfb0XYM1163zKFeAR3r/U9ETdwf28Sf2r5XDpWRNzwJ+p9HD
         EikkJhKLTwpW5Kl8HItEUmbbWZG09Onmhddxu5di7i1UyzU93GP6WPGlroDqJLnyKwbK
         lxiYXdkvrOWfENKwnw4JWxZnXlHES4m+hliZopyTTpwFl0INZuQO8WqcMLR35yIVJKJO
         lbRooaVhS2lxgCnviYe9pYHixPCtQiGji+FCLqB7P3iWRKkqKI5NQ0AfErdgQUoh3x81
         pYqSOACAGbGXbcoZy4bS9NHx2ZVrCZjhzhXyM5Bg8DOGbaFj0ppeMU7s+Ge/zTg0u2QI
         MZwg==
X-Forwarded-Encrypted: i=1; AFNElJ/gK67u0eV6yH728beEY73KQVZnckiYBJqGsydcr1Gdj3TDwI/irrVXw4KlkqsufFj5NyS9vIuNpby2@vger.kernel.org
X-Gm-Message-State: AOJu0YxLqbp9vW6btTdkaJZ/6MGU+0UMCW1TGLanw8+AQKv4yEQjNXiS
	rXFhP9vUXWT0ELH0CbL3bd3aW4gaEVui4Dw0tcu+0ylihzYj+sJFFFZee0+GhpZXQfmsCF+UyVD
	yhgDbUp3XevY/GW3d6dbCBwLrhu+AzVF/sC4MYb4UCw==
X-Gm-Gg: Acq92OGmWPMpkgOd8O5xnot7GVC8JW0fztiRePqJfM8muqcRBHMUrIIJIxF2GgBxAFh
	GOywmya+9ADoowvh9TTUck3N3Wd0mSsrgoiZLpBTA+qRHocop2coIkWYRc4Rk5NyAWV8UJf4Y0+
	nkHP6z3Fkggl2ubO3pfilFJuEKgytg8ld9xo0kB+YOjv2fEh1FM75cb1VWstMXA6bMzVgyBQWvE
	j6b8SWwo3BejvvaUzvDdAJ0h7RaNrMGiya59e5xQsS8QU47GvrGuhtB6bNb6K2dY3ZnP5N3GtNm
	uBEpm2ERCjBHdc9Osx/nV1hI19WS6az6/Y2iAnwOPE/2d5F3WxKuOtc5s6FXqPLhEwrdoms5eA4
	CLXYmBmzK5pQhA9PbNnsChz11mMMl
X-Received: by 2002:a17:907:a4d:b0:bd4:8b86:9026 with SMTP id
 a640c23a62f3a-bd71f581072mr99226366b.25.1779032881870; Sun, 17 May 2026
 08:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517154002.1994-1-sozdayvek@gmail.com>
In-Reply-To: <20260517154002.1994-1-sozdayvek@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 17 May 2026 18:47:25 +0300
X-Gm-Features: AVHnY4LGTD5-Y2S1moMJOuqKRXg1sLEZpbsn2phFWbiVYmCrgZnca0lpN8bLhnM
Message-ID: <CAHp75VdmNXjemOeGnNMu9=dmygfPjkeS7q72iCBWkbODn+9xuQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: intel: move PWM base computation past feature check
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: andy@kernel.org, mika.westerberg@linux.intel.com, linusw@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 6:40=E2=80=AFPM Stepan Ionichev <sozdayvek@gmail.co=
m> wrote:
>
> intel_pinctrl_probe_pwm() computes the PWM register base unconditionally
> at the start of the function:
>
>         void __iomem *base =3D community->regs + capability_offset + 4;
>
>         if (!(community->features & PINCTRL_FEATURE_PWM))
>                 return 0;
>         if (!IS_REACHABLE(CONFIG_PWM_LPSS))
>                 return 0;
>
>         chip =3D devm_pwm_lpss_probe(pctrl->dev, base, &info);
>
> For communities without CAPLIST_ID_PWM, capability_offset is the
> uninitialised value left in the per-community array on the stack;
> forming base =3D regs + capability_offset + 4 from that value reads
> indeterminate state even though the result is never dereferenced
> (the feature check returns first).
>
> Split the declaration from the assignment so the value is only
> computed after PINCTRL_FEATURE_PWM and the CONFIG_PWM_LPSS
> reachability check have passed. base is then the same single use
> that devm_pwm_lpss_probe() already consumes, so no other call sites
> are affected.

The commit message is too long for this smaller clean up. Just say
that we want to tidy up the code for better maintenance (it's the only
reason I see for this patch), otherwise you also need to prove that
compiler does some bad things.

...

Code wise okay.

--=20
With Best Regards,
Andy Shevchenko
