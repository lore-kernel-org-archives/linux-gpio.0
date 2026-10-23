Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792779595;
	b=PLHIvEz5VQlhoYgkqMnavy80/IoPcYUeNjKhJ1/nldhnP8xDucPJWzZVE7toI0/S65BR
	 ZOFXBPfjgLH6ByIeRovQAcP9FFnnLugqI2ynLrP+8IEMBwt7TOrqDKrqpO4CyvToPVaqt
	 9mPYMNJy+hdyJAjrH82+e9GOQZmrvoYJXHjwQgu+zhbvceolapuBCYBC4ZwOJcKWu7EqT
	 7JuCo6hUOV9jvpXhQtrv3H2EFPSQMKFsKvk/MBqw+JhzHkCFsBx1G+DbJBuGSSsrO7lVg
	 DgHqE1nkvJxY6IZfJwOJ/cIuBIF4UQMrYIUfxmG9TTD7rYYQx0orDZ7zqXVn9qk391g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
	b=EDVOCxW3AL3QaLzL23616LsWqbJpqJRwuoj6eCSrrhMWn6D2lqp0DCnoPlm/fCKLh7WR
	 B7e37XsVO2zT4RcjI7jOYcimbTrw5sFR0apb/TWWyxazrIju/v7M8dQ+x5RXKHrFRgJ/m
	 qthacA7Fe3ts+q5Yv0/A16Ik5ZMuBxGcCEQLPghecqSAMqmN8zrxvP/zcGnuh5BVE9PZI
	 kno2K32wiema7Yrg1jGJnuyLduxtTIbu9Z3PT4EYuSp4jL8tMhtl8fBmIHzcyZueWs6ZS
	 UP9ebw29URul44cba0HtVZRB9pxNVIcjeKPDlDBA/LYTcLNIbo+TBQ2ZLFJBbpYk5gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTVng4+k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD7E606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 18:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD7E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTVng4+k
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1111962a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 11:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792779593; cv=none;
        d=google.com; s=arc-20260327;
        b=VFSzyMI3x8OtOZSu9/56LkfDKiuNSRuuhLZ5GKGr2+EVnjzaU5OueS1Oj/akZN9BGT
         vS2Yop7e8uzcn0nQgB+jAmFAXsxlt6UbYSneISMgV+EV7kfQLUlQisRB4bkXe/PUSowv
         VWxJI1CGAu2Qmppb5lMyP2VjtBQWQhcmcoNjp26RBlSZ7oW9OplsObMLHA5IuaUOKoTf
         QnsDh0Ysvm9qf7zke6opr+F1x69gGqdzVG54mWJP3xjNEk1Zxs84+Ye8qrZdyu18sOlW
         OjJL3VTdQlzblrdJr0eAEyDFDzW8TDDGLSkYO3xA1RZUCcE7R11UJUIGqnW3BKT3gFo5
         wlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
        fh=30FPIfXbqyqjusQ53TJklJ68bUzEh6NL8yNBD1PtaUo=;
        b=OgUpndkhySmdOW7gAiZIHadmETWBbWD2cPkj2127fsd8Rr5kQhPSQkzlsKaPdf2E6V
         HGjYOKReYjBeKQmK5ZH7ChHLeJbRSKnLhoyYztsd0Q7Co+YrVPW5PtJvEKQphRsWM0HF
         qA6d0Q1krOed6M1yjRhA4xsNXzLU65bCIdC6Nbhj7UFoVIO6wEh1uWLQ+I38Mpo/QyKO
         bMEFNwmHkPNjDIKER3khuunh1h7tN+UayDVjCmabYYjqbqSg2pmHMHp6uooHtypgi54F
         bwXPkJncwuXijNEq6Q+vl5JJh4zTRgb1zzCD7J+rd4kaPUzq+241YtY2izxBgokghOqi
         ylCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792779593; x=1793384393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
        b=PTVng4+kNSaYoXcW9ZVpky8q6wGS/1f+oQ7ufoyFjtG2Wvv6QzpYc9OETVLucX0YLZ
         aINQMccPii23lGhCvpB7Ga/Z2ZGb4DGGs49zFY4sLcTgR8U7oab7Zr6cnQUQYX4tiRPN
         AiZO4ZfMme3RiM0tzElJm3Bud8fqTw0jGC743PLpawmnAd1St4vz6bmHO9/IZnURbz8j
         ao/O/+j+ZGgdYAMr3rMyOWXc7bM/+o+8ieMjEVgPYfs4nMtscFxszBWe5HVOjizdT1eD
         CEZGOxfccNgWXBw5eZ5jmaaax3HVC3Bak5/u0+lG8hrtCRQpTq8eNHqNJT8mNRXlSR+a
         A+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779593; x=1793384393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
        b=23b39O68lF5gGhj0rR8zEzSJKI5f0SYL/jLK6yt2LviblLgHa+4HBiH7piuvBv3Tlg
         levA+GaTbJEZkJme3a+oj2Nv8+ADRElBFqPjDFmobZxHR6mI7Kw+BcwZmttFTjhmZpNI
         pD6dq3q9UgyqgXxiIeATbd99EkK0oL0ijVDcYq3c13IzQr7bNUEmyXVPM4IiVZX5qYHR
         dgeizqcuIN6G2NWXa5avFQ8qoPO9efNzKQoQiIN48lLu/HxKzbXcOLNME3x8uiqi/frX
         W0LqRUFW6H1ZmMzpqP7zpYvBKHO4ysYxt028+2796/gSzZDFZ/D4WoBMrMXzQty9VpZd
         z6Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxa9+UuLHwfzXgeHJUkkUeiksSMyznixL/Kxp5oX3R7F+7zsbRgZmbtlwEY7GBa8toRmW0/kKGToUDF@vger.kernel.org
X-Gm-Message-State: AFq9FYJZYqMHK6cB8tKqwbZ/mNqmGAsW1l79SUdwygp4a/bALzKlDnUw
	f8Zk1dpWcCwniwBYnPg3uR5a4kDQQKWF50j16wUeMwhg4sq8swk7NzL+r5eCVQqqNLRyM8kzBVU
	IOqVQd//wzCVtviDEpaCR/BtqHoiX4AI=
X-Gm-Gg: AYBFou1KkS/pd6hRKkz2tklfLVKmyb0K/azIuwJAFS++TwOSj1cC8umlVEDWtTOn+mN
	BTwDzeYUSvcAgbTh8Zq5W3wUOEFYv75NzzvRCtOjbyEWI2vXk0xbOEBC+6KXCMfYAaOjAa0Qg3w
	3hceyhTiWgOCHLysoILNnzWcb/FauWJyoVdGjPsHkXgGtrqNmEPvq3kxaEWeeuQOUIvBvNHVdPQ
	QwBdVB9FhBHZuVk8fhnEcId6qqmXCJGfcILDxkdUtpd0Gn0nw81V+3/fcL+8/e/tq92oY2k60g1
	PbDAq/vlVxpN9sWm2VuvOuTtJAdQ2TvWuAypbmFxNYDpwujRDDFzp5/RSplrejNLaocLXL2r3Ms
	QTbkLVbsavxP1qOv+UbfvcINPy7rX9laABOwEvNzmrwDm7zgX1Hu905z1ixQVqvlzo8Fs+5SkEv
	RnXuwW+Vvj5r32/ogrfNm5io0NN/dAZDe3Bl+CqgSHyNXS29hXshOGniDC5H5W+2Rzn1HXn8nPL
	dEnyrp27w9ED7/C7GJUE4/0P8uJoU+d36Q3j2gS/Zu9GEuBKWB5/B+G8Q1f9StTyPdycuQ=
X-Received: by 2002:a05:6402:1ed0:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b442a82876mr18979a12.3.1792779593007; Fri, 23 Oct 2026
 11:19:53 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022022343.1409432-1-rosenp@gmail.com> <87o6ckqvsr.fsf@toke.dk>
In-Reply-To: <87o6ckqvsr.fsf@toke.dk>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 23 Oct 2026 11:19:41 -0700
X-Gm-Features: AclHuK9hNtjapAGTuPaNp1z8hxnwNiaSclFMvsF-Bmo9RDpb45Bd-X4aERvn6hw
Message-ID: <CAKxU2N9m58fCS1L7SQd_yzxcJV0NNyYHcj=jt_BVkrcc5rSOGA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath9k: release the LED GPIO after ath9k_stop()
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
	Kalle Valo <kvalo@qca.qualcomm.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 8:30=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@toke.dk> wrote:
>
> Rosen Penev <rosenp@gmail.com> writes:
>
> > ath9k_deinit_device() frees the LED pin in ath_deinit_leds() before it
> > unregisters the hw. ath9k_stop() then switches the LED pin back to an
> > input with ath9k_hw_gpio_request_in(). For a SoC GPIO outside of the
> > WMAC, ath9k_hw_gpio_request() takes a new descriptor through
> > gpiod_get_index() at that point, and nothing releases it again. The
> > next probe fails with "request GPIO12 failed:-16" and every LED update
> > hits the WARN_ON() in ath9k_hw_set_gpio(). That request also runs
> > under sc->sc_pcu_lock, while gpiod_get_index() and
> > gpiod_set_consumer_name() may sleep.
> >
> > Free the LED pin after ieee80211_unregister_hw() instead. This also
> > frees the pin when the LED class device could not be registered,
> > which leaked it before.
>
> Hmm, instead of reworking the deinit code, how about we just drop the
> ath9k_hw_gpio_request_in() call from ath9k_stop()? It's an LED pin, why
> would it ever need to be reset? The commit that introduced that call
> says it was "for consistency", which seems entirely bogus in this case?
Why would it be requested and then not? I imagine on rebind it would
error out in such a case.
>
> -Toke
