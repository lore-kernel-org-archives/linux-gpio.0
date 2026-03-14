Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB342571B8
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501709; cv=pass; b=Pj5xBIpKxnADr/9WFexbKGgAgNYl6JuWvkxCjshPC4PMDPTd3FZ2pwxntb+DWkakwXO+zcHcrXTdQ9o3XugeUIQ4LSGmYP9wNjgJ5rkURcfwn5lx3/pHaV9HtFP5too4EgjpD/2gQ9mAZ4AHp3VO2u66rWNdPdwinttLmp7KRmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501709; c=relaxed/simple;
	bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aku2P1AFd3HmqIo8GMykUabDS0PSmow4Hs91R/abFiAJTMfddQZocAqsWU2uv9N1/nNxCftSpm4R616oRceyEA3CPY83DdV4bdiZ01CoIMJ+uufqlSc7BWUhuaSTuzLk6Q93AWwMD1E+qJbHG7838rzsCWuP8TohGud6DsJsR0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmT9n7xJ; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmT9n7xJ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506362ac5f7so30515241cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773501707; cv=none;
        d=google.com; s=arc-20240605;
        b=aJcwJGRYDvTYy/nRjp2MzFm2t115z2tJohP4PzS8aGEhkyPR6Qu6XNUyacPLEKT99h
         0U+PFWWG3JQj+yD3PiED22skh6ccVnb94h5TJTrh4I0TLy7VnddziBC7EHG09McY9fml
         cFaJPLnmjHlM/giG9+WqsmW0sIiyANn6wFvw88z6EWmkT1+4dE51XkMlB4rw2ZXO7aca
         BIgYxmgTfYVOPiOyujDuO8vCvimpV9M7bsclWkGufO60chOQ1QIww8aeg9FhRW9U/z6Q
         T3LjZAFjWXspb10PBxSQFvAJ8vgQdPcP/DmJgmxTJNbdbqCKKBjusxajspoBeVp2B4YK
         kMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        fh=1Mr6t6Ogqg6OcYTit0sqeUKPPVAIIl90R0urQYMHFms=;
        b=CVJ1z5GHRTGgI731pqUAGty+DTOAGRZoYYtYGrCnS7pW6hTS5GIOSUTwrc3i6DwZZz
         nS9TQ0ehMVoICP7xZ9ADIoch3+NsUiAxWL/jWlQYq98YQXaaryCSQbhZNWyfXT6Jn7/m
         YXzCxBObt97Ap67Bn5YHdqXtYniObe8AdfuOD7ABEo375GeHPa9/lz0XECtSYimWKx9R
         R3N6wNsF6xTCwH1+LLP5BmqFbUDFFPc1IOu8dj8pEZFk+u8y+ZIOjNdzgrZzdmHkOoiC
         d4UvH3gsnWtlx/jTR5QZ5mphQ2FVXBMFCkBoJEaiRlgsLOMo28ilKCzIHbVJigHg4F8c
         Rm8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501707; x=1774106507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        b=BmT9n7xJh99ZqVSXMzFaeID85omvM5ddeVjkJc5Eciy3oTCKSpGMjfqqaOjklumibm
         SKI8UENCzzahjbzX8freIGg/VQmeR+RH0q1Kw9DGMFk9Mbh4DrvP++MsOJwwF2vEIODu
         WLY3d23rkrGrtnPNUSzHiis5kv2lBmFuex4qdnDkzVhlqsu3xWC8rizXCikthU3QYPXy
         vWho4M5bq3KopruvaB6w1cz0JzOMvSaY2fJYRU9rU6I2VPgohB6ZbUwVHgU7VqT2SLg2
         0kaEkECDCVBEKCqOpe/EaBVWH+gJACal/7ptmYpKLG8n0kju6Ox1oTZGrRNERPfp0O5z
         5IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501707; x=1774106507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79yloG2S6LSxDMg+2dBq+50iWkXEACUaWo+PxUDAKzk=;
        b=K0OUupiPDq9I0eDM/K1SIliXvbMA3439B4J2lcEs/tBYzpC60OajwNZiZ6wLNlasN/
         kq9WOFXxHOEEF+53VUeSZFZ+d28JE8WZoFTowbfF92HDYgKapuqqi9ReaxDFgNU5reDb
         Jrxz6gP0wbeV4vs5x3vBlxFUzjOzegL4J1begA/qEIUS0AHyDJTb2dYrtFLn2naljKRR
         uRs/xYpbmHEa0/j2wDJ1OY8VzM2XNkI26V1V/6HYwxgokoZvU7cpLB0c76c1uhGZhS+w
         BhBMCuEMa/G+TG1FCMV3k4qwzoZ9ya9FJvJGnYFDu59E7NOXr6dTDF3fUSlcyuZy9Kaf
         Wm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCwuRybYBxnlDaUoJrdpWKR1LWSz5oXv3Xqp4mFswT5CuSeB2eQagZfcRu4yddpQYlff70Ua5KXkge@vger.kernel.org
X-Gm-Message-State: AOJu0YyQUPfs/K3VCKMsm/LOV3csgiLAhhIh297M2cUrTXeLP+dxIVzR
	7BxazWCG3s3UJi8LMh3nwYhUf8OBqW7f0oFTbhyOOdYd3DJycHGF1WGxSoSuiYB+WMj1ywLK7rU
	sxpsPjv6IUj/GzFpK2wNoY0pbRUJ5jP8=
X-Gm-Gg: ATEYQzw93Vrtmpadh9I3RVhIdcgOXYCZ5e7Fp6TkUq496XeCyfn6WrurAiMU4hcKq3E
	ai+ZXE1d86gIsXGuuORqY+zaNYMIPVJ6C7OdaAzPsgVsJNS1rUkTxuR0OILiiscXKZmdM+/GYe2
	DsfGM5Qk9vsPhdTu2G8bHpVo67C/T42X2GFGxOzOAt7iFwE3jPsrtYfucGRuxn8XD39EWWRpv0q
	UlSRn5SzHxM61v2uqAUx0jvJ/qyShgx/QVqO0ymyJRTNBT9eOm5wiIR0N/uCswUU8k/dhNZ6VI2
	FUau3MCc
X-Received: by 2002:a05:622a:48f:b0:509:30b0:831e with SMTP id
 d75a77b69052e-50957cd8e8cmr91300511cf.21.1773501706958; Sat, 14 Mar 2026
 08:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-7-akkun11.open@gmail.com> <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
In-Reply-To: <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sun, 15 Mar 2026 00:21:36 +0900
X-Gm-Features: AaiRm535EmprjKZQc-5oWppPCZE2tY_D2F_kXvT9geVdj9eW0363jXm8lhZ_OXM
Message-ID: <CAKr_iV4m9Jaxv3SCR1Rxg4ZmKPCkDteVaLZNCJo+tjqhX0=6sw@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include
 guard comment
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linusw@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, 
	erin.lo@mediatek.com, zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, 
	amergnat@baylibre.com, seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> No bug here, otherwise explain user-visible issues.

Ok, I'll be careful in the future.

> No, just a churn. This has no benefit, because it is obvious which if/end=
if
> this corresponds to.

I understand your point.
Certainly these patches do not affect the compiled kernel.
However, I found that there are over 400 instances of mismatched include
guard comments across the kernel. While it doesn't cause bugs, I thought
this discrepancy should be addressed for consistency and readability.

Anyway, I withdraw patch 4, 5, 6.

Best regards,
Akari
