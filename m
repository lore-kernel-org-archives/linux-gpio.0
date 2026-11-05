Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793871768;
	b=OJ8LYAAqcO05hW7dUVNwJVDPoevNG6OlP07Cbpli1sQXrnGz1hlB0QWZABIqe1Ex4dOV
	 DzL3zW8D6djWD35sGcci2cznkNBKg1XsWbzZt6gknCXvMeeHa/vbP/bNWGDsGyNndT+9W
	 TXZ5tMsjcrnASOJ9B7yRm3rdHJD4ai5UC2w5y5epFaqNRJnBfdmsc7tajJDa5Ahh6kuW/
	 fcCgdRSdEflzAT4lOLGFDqFxNuCA7OEAfRqhY2xJlnNI8JUD6dI7a4UUPKwp++eE6MDE5
	 uj38nT1y7u48ZvN5qWfjYbHzPQxylWHziWrNpRA1kM4nuj4uZysOSDz7XKFdoXaCg9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
	b=xMTZZI63t3rbLfSC6ue3BpVmxXJ8Tx1HQJlBWfwUwCGFgwraiCzt6gtYFbiBaX5kI1n6
	 kAZdaEeWTfJsLIx6t2gdRbLl9Ke0Y9p0bIe4t/MjYJDY4pqSDm9Iyuw4NDXIxF8VT0cgh
	 EmbM9/DbWaCs5GwctMRgjDwaYlefn33GC7IEoyFQG5NE81Ynf8oLB0aO69KyP98hpq9G2
	 fLkwmC8UiTlreRLVIoz5xIxD/FPcs0NOXO/iWUNZvbVhoUdpIFWCb4ChZlfVMlXD+AoQs
	 kGJW7n8w5vyDCqMQzHbd0k3vHFIgsd9Jl+KoIJoHpGnsIWG0nNBDm9lpxa09l72UccQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCZOVag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A089606A328
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A089606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCZOVag
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2127974a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793871766; cv=none;
        d=google.com; s=arc-20260327;
        b=qEiGvjuk8nqHWkKm+zzu+l5fbm2kcxZgHcGdk44Uh9Ri7uM4kMmM8R9FTuw4JNRozV
         w2Ji4YWfXmLXHT2SPHzRRNtfTek2REBLdWQNEzNjwLTHg1Y9iGBspE2LUdS9kL9Q+KF/
         D3sJQgL298xvvcrF3dfDDTIu76wpHHwSQnovYeASbNAjsN70vDG4r88d+jZe0AgTujj0
         t9LZABJ/MaSErtIOi85H8jfyweQfUgNlAdjSHAxLBJ9Evk2zi1s0MuTdbQRyERnb02B4
         aQRSz6qCAifEI26nbHixBwKjxJwG0apv6qQAMbfEfaJshaL1ox2y3evLDEEVl2DQjDtY
         zBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        fh=35g8V0xOpJ+xbKDZ7abbVR7tkigcqi/F/OazcKs4qUw=;
        b=BviuZ8knPhzaNv0usu7lAbNejkh3T7NR1rpGwNCPX3/kDHsesj9F/jROC2VldaVtVi
         3dBw2gePmIUkE3iYTMp6AgC4l1tQTa6ShcS6ZrZWehymdDKqBs0ipIa5QipovsJhu5BY
         +ipLekO9U1hAR/LLDZGItU1ckNxT+KMaAicN0AMxzUI26ToJpnzfOLq/O/ioPNpwnV3V
         OS10/V0fDnI8QTzPIR5b4kHies5gXZfSJlWLjcUw7cbQ2g9WhWzym30cRJqOdwtx4l7f
         khoVKE7jElEdXlVb4Sl7hPRWrcVuQRr5O2wBeIdT161uKi6T1y1CVWfzt6k5dLSRQKcS
         7Y3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871766; x=1794476566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=lBCZOVagTQVLd9KXSuiTDMdDSUssX6sHOvFz6jllJYqirrCE9hPUTo49xM4gJtulHD
         mbB90BoJR+kAHY5NgspfzKWw2JtqDRvz3eqaznwFv3AmMzGIX8fp8vhmJSQ0mwgwjguK
         pT2aWtLj5fBJ9jcZbx+nC1NK4eQOvNHWxie867CTF/vf5DFavxvesOEdTQSHjvJofvqW
         wGHKGvjhrHgi62Vy+rz7cAxQP1+FsgnMIG5U7uhcDf9ppFWsbDTtAU5ysfnZYVzCix4q
         cw5IbWu3uYh8SbdQ59hSYfZqX6k7oxzo6nXPyNkUXO15cChw3EeKoUbntDa2K+ueweim
         kH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871766; x=1794476566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=diOrNcXowHZZW+w+97Gw/Sc1iQdHVLA7u4818gxCnk0rNpJV61FtINHwv3M9zqy6qq
         YVEgtGALTgworluHbo+NxNKoQBAzqOMdU9d7W+It535N+77o2y1yK65+RLq9TaSUNm2/
         cWH8sZADoPR/osFME5i+MA6iyR/+hhAdak8BNVYu36P+i79ZXpP5QitwZgwMU0lscKnN
         UHsSSJZ/WciWgiqj4raS2jFy01wb0bFL36FRgKy/T8JeXhaasF3gVFVgldaeV7JnkDeR
         l8intvwKMpvO70Vix3ffk6ZfMlb+P53kwynzTBIwtnY2gy3ceewswV1QAU5iHYcmQRup
         YTyA==
X-Forwarded-Encrypted: i=1; AKwUvByDO4efMAPxwGd1rH+QVeP1fxyoZRM/JkYMFVvjPdXBjlM8VmT1n1jxyHba8eAYHGmoZqE8BdVn+xpE@vger.kernel.org
X-Gm-Message-State: APuU4Z+aenhnuTpzMd714hmohSXfa3JUGAcTHgvAsrRA0LdYYpm38Fb3
	q0bjpXB3KZlY6AAs6xxwoKnC+Pi9bWJyz9TK6eyJG1qGKrTpA/9BfZxpw58D0VXKdC5bL5Z5h0e
	ZAruGjw/ap46joZbOhSXnGes56SCk8UE=
X-Gm-Gg: AYBFou2XtmyH5t0RZMP6b+ba4R1cjWumRB/7Ho4PdLwaf87DiQ69lmzWbgKlmeZcZJT
	DwB9Mq/55W7vBEp5aYypi4kVIR69hmDCm6fLxGHZkAAzG4K1AK2smko8hZJEJJ9csPVfWIG6NEv
	zknfbHZyhVgCs6a21PbVbOGEPdMocuG8VADa9uBIwTmjrCM9UZ5X2qFFpqN4TQIJP0IFAsqnxmH
	VrTNxMZTINBG1MZs3DFfgX+Gqg4WxOxrakCLyp6xeE1XGORDcsmZ4Brte0x+bAdMGmqrubcScwN
	y03p8TFdlHcHqTbUAOYNPpzd5MTvFI9l2j6Emj2YJ9TGPYLl1VuXlVNvi5k2e+pufZQbg3cBIWh
	X0CwHHHfMa8cADps5nUU0B74RMfjU0S62aCw=
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id
 4fb4d7f45d1cf-6b4d3377817mr10254827a12.2.1793871766289; Thu, 05 Nov 2026
 01:42:46 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261021105109.199886-5-l.scorcia@gmail.com>
 <179310028255.2808517.13933580516140278450@kernel.org>
In-Reply-To: <179310028255.2808517.13933580516140278450@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 5 Nov 2026 10:42:35 +0100
X-Gm-Features: AclHuK8keS0URREeVHi2bDcMrIMTrg9GDE11ruNkJWdKZdjkdmjRgehGKxzojT4
Message-ID: <CAORyz2Lv9fBrKZOQ7kFBE+u-nJ-dFpRm_3G0JTS=bHtEL6n_GQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
>
> Nit: This is non-blocking, but if you have to respin, please use the
> 100-char limit to keep these on single lines where possible. Same for
> all the others below.

Ack. I will rebase this patch over current 7.4-rc1, adjust the line
width and send it independently of the addition of mt6392.
Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
