Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614368;
	b=H4hSbfubx2CpMLXst5N8/tA/b9ZAR+MhRzRcKqilcYbCWSaMm29YunJVf1bciuhbr/tE
	 AlhkPbZBLrZE+3RIj9D6sQlt53Uu3VAldFBSS3gOy6fozgDRAzeDC5Bf64yOP3rQTDB3o
	 ilTpZOcorlyfO7+4O/mwuWpzASvsMLD8SJAWrq5LJDQ3e7bg/xiJ10DioXW1mvFmvMN/0
	 upyIjPeB8OC9fxOCV21MQcalPgufK+VEGJJctSUOPel507mtioBWdXbxF+S7S3Eb+ACLa
	 itYRL1bMfe+DyqW3lsva7r+MBLsx87hY4JtCESqLNuoepcL8Kzz/7+YJCfVcqnq04pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614368;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4jZqsZWp4ooYwhfyJ4y0mJBIywKILW2kOFcQL/uGzgM=;
	b=J+qwsPRrxj6aZnam3JJcTcc76U5GRcaE9zR9C+pysb1ikzt4COMt1EqzE+ySM6XLc8pa
	 0mik6u/3rxKv7Wm0ZhSViDC5eXXTaSwK4hrvJSWmPAcwrj0PflGzLYAS96bubfUx5uFvb
	 nE1ouVS1nkmD/O+iqZl6IJyEYtIMR9C0fvgmaUJloL1rh1SrHQkVxxBlmWaLU134Onw03
	 9+deLi2yo1Q+kPo3fkWYBXoxL83hU8brAmbiWE9UifJKpRqQo93qhha6WnH7FbNVoYtzQ
	 1r9tvPamWYBB9q7XR102I7MP31wiDW6xIt0Nlk1eShhitxSrJH850x5X55L8oDlkSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifF3bAuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83380606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifF3bAuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CA91F000D3
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614367;
	bh=4jZqsZWp4ooYwhfyJ4y0mJBIywKILW2kOFcQL/uGzgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ifF3bAufXHV77XVWr2MRCQo63HJHoPyW/kmeN3Wdi+Uvnhw0o0EevcXIraxpZahnt
	 Tpr50qs9xBUuFTmDSlAUiGUk34SgUbxs+xzVnvTX7pwp4g8EjSuSoueSHv3F6/z3lR
	 qaq7NSXMVFFWhihtPoPKIdTZlJUFgfNlo6Mo0fwdRRbM/rUC5jMYnpds6+UyMTtaEc
	 bKwdZsWQEWmocA0bba2B1QGs4Al5L65C1IPVpMMJbRr4D6K6aOIPRehgJsrkMXJnco
	 RlhlfKvO4ApSKsebt8G1xGjjwszVEOdvuSYe74chzYgoE4o+zd6R8I3LuTfo+aAdmv
	 TtDHhHNpAiP1w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be47aa555cso7243470e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 05:46:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEhWl2TU7Dc/5cxtrHqSRuDxCbfmXMgORIzgX+2x0AWjiwXfZo4Exd/xj/MEZrsq8rB6WmyhDxJXGnl@vger.kernel.org
X-Gm-Message-State: APuU4Z80vUx7Si1aWK+ZW6SmqYkoRbglsrgJ5AJ/fIhgyJCOnXqqbBJo
	jQ/NR3cfO+8tcb7PGRHXoEXVaMQZ01pfHr2IcrfX9wWaaN24lQ8qrBYsb/SZuntazfW6/9tiwRX
	ZLPy/LiBONnBRfvUZA45qS2jw6sbkxHo=
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1bc8198fcmr5837892e87.54.1795614366500; Wed, 25 Nov 2026
 05:46:06 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:45:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkSNamcvU49S29HmbbqPZiO_P__-vf2VrUTbiOTYQ5nA@mail.gmail.com>
X-Gm-Features: Aa3M54r_va3lokUc-LWrlB0jUYgyg2M9NoU1QfnHQvyjmsPDY4Ce4kWCvRRlMHU
Message-ID: <CAD++jLmkSNamcvU49S29HmbbqPZiO_P__-vf2VrUTbiOTYQ5nA@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.4-rc4
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:17=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of fixes for Qualcomm pin control drivers f=
or the next RC.

Pulled in for fixes, thanks Bartosz!

Yours,
Linus Walleij
