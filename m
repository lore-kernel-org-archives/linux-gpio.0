Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9106234DCF3
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687890; cv=none; b=I9fbLwrXJvSXntoxIas/y5PwizmJ5fV/p6GDgNeLNpQakR2Yb9R0U0wM2A5KUfnG52WhLiXeEru//v5zY/QoxVvUYi4HIJC2AfXnpkwb+nDFVPwdJh/FukPYAdwUiskHcW+sQkC6IwiASNWU+cro2w5FPGdnAP7iPVL13vmhlEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687890; c=relaxed/simple;
	bh=iipTRm7SSnAWk8Zruo1+ckViiugJGY+S24COo4uG3kA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cfg04xr/CQTB+YXHp7xxctpxuwGN4yBsMDDhiyZSr5KKeNFPNBAV5qq9YG6xG35mXw1pmV3Ujhd5b3PCdh7trybTTQzrWCUKf/2okBYvqI8fy+0zC0RPME8QgFcWS90cGoiX3R0hDbxIV+7u3/6n8MSTb9WxLhAi5U6sYYHnFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJqk05L+; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJqk05L+"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ab17a156so104114a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687889; x=1791292689; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iipTRm7SSnAWk8Zruo1+ckViiugJGY+S24COo4uG3kA=;
        b=pJqk05L+qGb2OhqgWRMFLDn3c4sSuvPAwOTJ85npEalrQdtHBXsJ3rpgxiTbrrumjC
         alevKnd/UVw/eA3LASY+aicm42Lnz1RN07kTjbDFvHw41GXMQOUGLBg5S/mYb5dHh+m7
         uE15ts6MI5Q5C4QKs6ZR30WMbnIo3sf/LNABwQKctGtuNvqeGdBjQrNXN7P0DGlMOJn4
         buxHAeDDBQlDOYVV+VGJOHIbAV6Zl3G27/O4QQCilNx8ikWtnU3tFZ+q7Zm47JIvY7Aw
         9XIjr3fclCnvrsHHeNi022R0imx/4Yc6UX/AHxkjxyMvp2HiDPgQKyZelWJQJVBAuA5Y
         vEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687889; x=1791292689;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iipTRm7SSnAWk8Zruo1+ckViiugJGY+S24COo4uG3kA=;
        b=kEPdX2qDSKlRcPztfV9J6+l3WbnvNa/xGrGgrgRl9dl04eX9sWsDkK6U5I5DRcRe9h
         Vr/2Jlu6iltYd4QT7E51tKeeyUvMyCW2374KY3HMBfyPkqmzQpsPb5VDkGd19PUZLPLI
         wDvevkpj3UQI0upIGgack1Lt6JxTxc2zY3UIf86x0i3ImRGgxT7wErfJ9rAu8TMqVMKZ
         hC4Q63ISlV+HEBX5BvhkTv8I2tWN5VyTorJac2wlqmFvHAgvpxsrRd3IrSd3rjSkKwwz
         v8ipANjcltsf2R+TeaH7SaxYTGypsknXPvjf4SNEFCdgSQFUCI2AzqQrXbcRu2MiBXBA
         kOzA==
X-Forwarded-Encrypted: i=1; AKwUvBzcjhQ7i/CWjcaxRJ0MQsEdHvMQAJ8HQdf3PRUiDoHKneUHcC0I7VChkhcWeys8YIwDM8AvGC5q5hMN@vger.kernel.org
X-Gm-Message-State: AFq9FYJP8pLeIGl8y2aIwci42R2hyuNaWqynBmdI1qh+ZMQrc+7jFCAw
	8ewjxLCWFIpb2FRVs0VXui7ediKrGfVp82QAZfcNnaQLevqZB5qP7OuR
X-Gm-Gg: AYBFou3yU0wnFJfGOXcnkk/OyGLyI3NeHk081f4OGbtPcs1Pz1XUV8ST/UkRoCoyONo
	boYL/G2cZg4nKtC77HtBxV3Ze7CpN0WTOYgn1t3P06CrdDHJWxrtl2IaNby0H7IugsNYqh+A57y
	KewdqMrW8T141Q2DksJNFEzVjLB8DPPRAkI/MIBPACG1Bw8PUFtGxGcJDfbWmLtc4UG7n+Qcy4u
	m3OCR5QQNwQI4F6SvgnD9zyEeR3M6KJLPysj92KVgqm7um7twnfDCLoCQNjz+3Lz+ra2pKwqYvb
	SK+h2U3oD55f/c1DCoe3r2/3C79rtQi8XyuVuBkLmVJ3CRU46cijaoQ1QmY8jC/+3eD1ora+nQi
	19qJjVKC2TkyCn+lwZGJrZvrqA8IalKJX6pCNwO5J48ul3xuSN/YySEH3NhFLmv4+zFIPz/8fMQ
	xVv5YuDzZJduqBGjenCEAOgOMYGPBXU8U0ccpS3j18PAHa5FnvVpe8opMRnZpPyHx5JbQxEmmtf
	5MkSxTCtLe/
X-Received: by 2002:a17:90b:1844:b0:3a4:a068:d05c with SMTP id 98e67ed59e1d1-3a4a068d828mr3073664a91.5.1790687888665;
        Tue, 29 Sep 2026 06:18:08 -0700 (PDT)
Received: from [10.7.1.8] ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787941a24sm6244641a12.19.2026.09.29.06.18.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:18:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH RFC 0/4] gpio: loongson-64bit: add interrupt support for
 more models
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Mc5JSVBnhxp4ctrz6hOj62W2rjk4FJj8WdyE=yChJ_FzQ@mail.gmail.com>
Date: Tue, 29 Sep 2026 21:18:02 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DABEA88-6F0E-41F7-9B52-7365D9C369DF@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
 <CAMRc=Mc5JSVBnhxp4ctrz6hOj62W2rjk4FJj8WdyE=yChJ_FzQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)

Hi,

> 2026=E5=B9=B409=E6=9C=8829=E6=97=A5 21:01=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Can you please resend it with linux-kernel@vger.kernel.org in Cc? =
Otherwise
> Sashiko doesn't pick it up. I'd like it to take a look as I don't have =
enough
> context of this driver for a thorough review myself and it's a complex =
change.

Sorry but I will not be able to resend the patches until the repair of =
my
laptop ends. I'll do it as soon as my laptop is back.

In the meantime, I have discussed the details and the related context of =
this
change in the third patch.

Cheers,

Miao Wang=
