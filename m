Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795183171;
	b=HiEcOc3uu3QOvc+vqjdOmVGgPh/JuQjUHWWMM6M/Fpoz7fKXR824HplFHqQenjm8pGli
	 BNEXYrCSns9WJIdRy8iLAwqdDGI7ypFFG0qEJtOGoctJOlCSmEozNUVq0zoBOp+8sWSVN
	 1BrITHckkH9mT2lHJHJdWQ/q2VuuH4gZ73KeozmVkZn1t7p3h0u1uxkeJnrn9kdZHnkh7
	 KVRwCDWZmYL48cOZSkvVZaA0Somm7OyIB1dvrH206rJUXs6j73+zdhxUlYIxa4KA5J+EO
	 Ghrb5WgshIegfm8AzS0nMPb22RwgvYWL58nmrIWT6n7QQQX/6ksXc/kSyYd2wqdkYtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
	b=j/uYkaMbn6F4N2SOLifVTbXgY7YUG0xUcW85fp2azbz66Czb2QNfdtdrhmsu5npyde8x
	 JbSmwu/nNJY5AK43ZEZcoXAb8TD/g5Djd6zE+Vf7xlXXsEx717jA2KWnDP1lOmxFBaU4K
	 PsORr9etoeS7hqkJ8n/jDRKcfK6/K+Uw5CguvG2sGIjFqBg+uUALyWnauJskZe4vCvua9
	 wAHNoSfeTnjPlc+tkhCDBMXE6+vtRQOqj1NQHBS/RWfKIvTr3YZo9/WxYpUVGtihhFTKT
	 FOXzu+ybX3kJds8pAgeNEnT2+NsocsOLb/nfGDDcegVXEecjMT/J5SmJlL1qRq3raFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvE4oT5W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0077F606B98B
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0077F606B98B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvE4oT5W
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4ad587ba293so654415fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 05:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795183170; cv=none;
        d=google.com; s=arc-20260327;
        b=aOx2pUIou1B9VYdWmVCOXRt5AX4lEOs0Vi/+MHsgQMxwGG1zca2wi6YcpjTMV4z6Yw
         VZtYbHKsr7oh1nwxKr+mLz0dQwvZZmWbPW6B5NPC3HitYZNgTsY3ZjBgF60JuJuE1Wyg
         2SVq9FiNU3kM2/kiutNfqoJdSD46ixhXAbPAMmQYJ4XhLE59mmmfXGr60gB9aGLdx28x
         TUKagfPvv9wVI9lsOdumtfWjvCsIUaqnhS5+7ZI/OpEFPnV/qJiLJfCsSA8eRknWWGow
         GL/AmyfgjiV6Xluc7sal7GMtvbTeVF6zQlR9BQeQj0DmCPIxevj3f62W/PZO9yddAaEA
         OEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        fh=3yie5IMV0XUA+4tihlF+VOPzQBBX5o7CTg6EmFtAcAM=;
        b=k0UxkhD0XVofjho7xOXc5GOfmtiiG0/D6FtPVucJyDBjqcFisG0YSYQ97BH1Uw/vPB
         xf3uB+lxBCUPhliNEn6bHJdVh4If4vqlpPbV/HqabbRSXD6nyDUFAv08Mnnt5P7OkIFP
         8R5+PntvOhmFoTleNQ9kJ/c0Nw1cqvtt+GoYucyo14d1eASsJlnFmHprSsTY8FybTPLb
         6zHUWGu3r9NSwyfKKKBKTinplZqhnFnQaPEyek8BddXuaM8OJm05cVYGLpQBsFiyhJOA
         rpMKx86tRiSna46atYJr7RK4F86MXOpMG8IClrTkskAAzL0kCRTlNd0UXL/lEBpfA05D
         qQyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183170; x=1795787970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        b=FvE4oT5WNuD76Q7AIJYfkBzPg8slJLrz/vS8FoQo7Ih8vgb1L79K2m+R+d7nBhJ6+g
         JEZ06vWgz4+I5zZVoaGN5UNaj9NvlatKL7T3otDyg4mcOR/DT5PpHPIEyhJbC6Tfl0q+
         mMytsqJk8j8EPaZTS1t7AsZcq5fCirj/Uu281sEJ/7uBF3Hyb5Nyu/P3xhkjc4FZhYKK
         y3RYmhTtriZlqXmwh3AQdBDuoJRApP/OLepOLk0cbb7jxHjm3Nf83PDlwsprVK2+6Q+V
         tBzivdpct7wvGO5Dt7tS0mXEOB0W/MjohTcHmTJZFCOYOAzml6dFQx7yO1/oxKeFvS3N
         YeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183170; x=1795787970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        b=fHaxTJGtII68eTlRP3hFcYsWAcetE6fRp5ygywvjqG1abj2MVjOUGTFtYL/jVrDj6H
         G4ydrWsPUkBUGzPZCLMHKxd/bO64iF8Fs8H6C2k9pF8WE49DjUd07YJjeQPM/h/++oHf
         qpnEE5koapOq8F/7wLc7c8pYM1pgxGRrz72ik7jKAWNMM65S03/T9GzNBieSLKpNmnOH
         rbEU+vDdeccQU4mbffNCjpJUHoOz5GgidIuCPLF8UKOFrclp3lXCtIH3fhcWLgkW1g/B
         LvdPh0qdVhfcY5A6MoGloQqtFIFxussSaFmNKJtbrTbOHfuQlelXJalOf7LwDzEPgjxO
         Dw1Q==
X-Forwarded-Encrypted: i=1; AL+hErGDd5WEqW4rVZFcxJwrnz7LMKD9ND6kmGTkLM/RCG0cjnAr5vbJ5KbxT+excVmdh/NOkUh6OxG7W2Ti@vger.kernel.org
X-Gm-Message-State: APuU4Z8QB+LShCY+plqjGLo9TBtjZQgKTFoke+dj/mx/4FTfGU9E9WaA
	lkIKGVGWPpcqvV2pSRrNx1qYJckUEh3PO/ssC0nv/nDIt7zahLetFS7oCITNwvskPKiChMv7Hrl
	jRFMDT4IIJmS+9LinE3PHSol2DHYOluw=
X-Gm-Gg: AZFdTZevuKvffefvdh3CPIWRDsPueokwavzjfK13G3trSkddRDV8NledypvhlNW+AY/
	4zIB4I8CMX9M0ky0UwC036p1woxNnVpXTnBxG+v4YBHFPEt8KQFPZSHVwnHeDllOlPJR/Y4Xsb8
	zsQ54jGQcG3pEPiUI9jzI/GxUTh+Teg7IIVyNCeiJLnymVAlqKJKSbsX8fhjV1TwbWTaSia/6P/
	SNml/VTCFhkTBnOuzKviNu/VJlm8cfoyNukmjrAj2xv2XRtG5cy98nGkdY2K/2VhStN/FAAbh0a
	VoeeFJUidrc2RlluAGhtwfmp+10A4X3xqwMy9Zbzm7hQIkyC5KnZXs6AslesVqiQNjipalVB3AB
	jjXkKSiOF8neM9wH1/D7VI4CSbfLtLRVlRBrdlwk=
X-Received: by 2002:a05:6808:16a7:b0:4f3:890b:5fee with SMTP id
 5614622812f47-57a0a4053acmr3862923b6e.16.1795183169924; Fri, 20 Nov 2026
 05:59:29 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175710.19181-1-vikrantyadav4802@gmail.com> <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
In-Reply-To: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
From: Vikrant Yadav <vikrantyadav4802@gmail.com>
Date: Fri, 20 Nov 2026 19:28:50 +0530
X-Gm-Features: Aa3M54psM_pWxs9m_9RKrfNWpbmCodZhUW7rZuVIdUL71nTkadvLxIio0x3fNP4
Message-ID: <CAHjiWjLdHxkq=1wxM-ai5fOkNW5r1GuvEnFwhAS=y5h4O2q+Fg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
To: Linus Walleij <linusw@kernel.org>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, lorenzo@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 at 18:58, Linus Walleij <linusw@kernel.org> wrote:
>
> On Fri, Oct 23, 2026 at 7:57=E2=80=AFPM Vikrant Yadav
> <vikrantyadav4802@gmail.com> wrote:
>
> > In airoha_pinconf_get(), the last branch of bias check
> > "else if (pull_up || pull_down)", has no check on the requested
> > parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
> > is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
> > PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
> > earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
> > reaches this branch, which returns -EINVAL. Reading back a pull-up or
> > pull-down therefore always fails.
> >
> > Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>
>
> Maybe Christian can ACK this patch if it looks right?
>
> Yours,
> Linus Walleij

Hi Christian,

Just checking if you got a chance to look at this patch. If you want
any changes, I can send a v2.

Thanks,
Vikrant
