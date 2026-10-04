Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262D384CC6
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791076111; cv=pass; b=KISmTB6W2O6bguKyNRspQdMNU/9zZe31/C+FkdrjnkFT1Pk/8pCt4Nh5Vte229xzo2h0+TsVQ13SrKzj0xwkjZ8Q2UMpJxH8mvcZ4HGNG6bgSb2DG9fbESEdhIWbMRTDqgII4+tmU5dOauO8GG5W+eHLRvwEQ93esvPpD33eXI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791076111; c=relaxed/simple;
	bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vENhQSpif+dS9UBb9nyPkD6g+5b4zsN4Zx+oB3zUbSYNvT/Cpx9VF4xNYiWAE7lUyr5GzMQ1s5RGgiAM0FNLIGNng5hnsXF3nwKSMEbASkR1XJwfcteYUHN2Ol7DU7cYGldgClVUhvtu/xe27Uws2GVcu7jQ+UjRKFgY8SbwU8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzY2vk2T; arc=pass smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzY2vk2T"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882c2bcef77so293518b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 18:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791076109; cv=none;
        d=google.com; s=arc-20260327;
        b=ft9O2IIvyaxVOzQG83iis3UoPND+/uReg5oLOeTBfzo4ovBS4KcYYBZ8M98OsT65uM
         YTE+2XFM5C9AYGn56ZQUIrBJc9aYkSZxHLmoZHXJKGM/3hnAbwUqyq5AyDB6xcdJzWfe
         p0ngfYMYL/ZFeUdljN2nuuDaNaxQHjd9kqVNCIHMHxilz4Di2wOEcRXPiizbMLYYEN+/
         yTsKPCXy3ZUfX+9QTODVIhpuMJ4OSqFj8bChRagZ7u7KQEdgrplxidnsDeNkFdUslV+S
         rtHRfUxLXUJAYLmEONqczOG4UrBMyB5taw5QdTvOkpON1gfIh7ilqZq0K+QmaYb3QN48
         eXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
        fh=GAPlUnCkZXQDGfyFzG85T6+nvWY2GouBCiAGKyCJEe0=;
        b=RVVdch4TF36VYHRGcGcC2kdBGk3qa7qX+lOE5JoLmsK82Z0hVNeSNehXzDa3sgoZIh
         hCFluzUFjS0eO7QE5kVB7Qt7z2MbRZUSlReyF2equjbvemZIYvZNOlFP66kp/m8ofkhw
         EuGrj7DkJtw8SaheiyqysX3ii0wS/R6EMu5T/1Xm9MAGW3fwagSSRz8CtZ22ITtBxk/n
         coTMJ9uiX5qBgHdscJ12FwCfnXBvD2ALAWMhqFjuNNQPIuV5VrDStGKrqwgsOf12TnWT
         fLEjevklHNfAIjfBxmn1mF3gR/1iGH0haxpRITwJiAVnCQ2wKwUBds0mVaXgk/giQHgf
         9m8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791076109; x=1791680909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
        b=mzY2vk2TFGGVC86GKQK9tv31m/zA+ShbspF5huJai4M+/b7WtKtNkEoZC4PPPOj6P8
         uJl8w0hIQPLq2fw5+EVps1oLEXcl/Dyh0p7CS8KvO7TAuzym36AxUa8M8zBsgF8EUT9H
         3KKGB5ZQ/FOtPqNXTT9hJusHgD313/QFjIh7WTLg5WPhMjJMmmxN71ToADhveemJ7nXK
         hvYr3mBgqeKhkyrDvc/QfJbBgYTPICqcgbZ7BEWv5M54wrXX2uvgiEfNiUWZm6YkL4/Y
         7tDfKchtLtjdvz6ZDHHJGgS96f1+qk9OFecZn/mdKzGUnfqYhE3WPvd8g/+oM/C5J2Su
         Sncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791076109; x=1791680909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
        b=BQxQUKff3CjrNXnYPpoUPOyHLdHjKCXlotx0/yGYd9ff7LL3xQZRDjtXDJF/FSTwb5
         EaYZZ8uXv6fH93r4IZfjJMFU2m6bCz9LHlCTC4HoML2FUnUnhP6vzXzkNZJOzr5tVT6L
         PnzO36UuVOu4G4O4g8HttW9n/VTMxZfUnOuwum4LjSTsN9TXKm4Pg887TQ85lOCKYMYC
         8RP55wI8nngKU7Jk6G0VZF3R1OahCQVNtfHFrdI8UObnyqdf7Nev0waw96Nnt+wW7J15
         Vck3Yn4wP9H4oDFbOwaeQsuboG6JtCNWrNSs9WThxiYg6voGZntAcX/WBQVv4N7WaNOl
         PUPA==
X-Forwarded-Encrypted: i=1; AKwUvBx6OjfZoKF6b197wQCFVsLJcXLNZQK58+3mj+Kido1P0X3zGHUOweTbAsYikW2IkUWn6QCJq9F9Leoo@vger.kernel.org
X-Gm-Message-State: AFuF++niEyiKnpqpFDetLjqIHq3/sH86W0wecC5A1msanfXn5tV2qiiu
	ySN7wRnqvsq5mEXJhiAJNyFCXdTxaoSJh1OTi4aSzF4jHcabHsAI9xzNC2kOCoOlJ/Ju0ZCoXDP
	fAOKZIt7j56cX/jjTcK5BPgVDoSSLeus=
X-Gm-Gg: AYBFou1/RdAzBMVzYlVFMLwjdDT7GttBxaMmsyW5128HBRMq00gVKIR1lA9RHX/WZ0r
	3ZGRfN3Ok2y9txb4J2WUuIjJsOxMykIIAiV960JJN/LBMV7KKG7X3WgxncJs2iWu2Ocodl3LNE2
	9phz0ovTv5EAh7cuGXiydoouhg2e1/B8ewvOkNBIT5d26ouudlWwk4W7JclddX+VQrWEW1/5Vrn
	ckmKHZH/UJDruxtTBYyQARQ0cVM3BouvFFXO2urrswkYBbUEWoKIzJhER+Hgm4r5A4IGgrZ6XOR
	ThXJ7mVJ9z3IMYJXxggLbH+sGNrB6VrybF4KH6H7vYD3GmoK+fxsjomciWSB+5EyIW2/pkEl0Y9
	li91FXTcpXmd3s4h2aX23BvKOhsl8rJecyi+mjw6cKRSzo887c/Z6St+Z0YXxRj5NvxmOGhm7K6
	ZWVRZGOCVtLwVkaApT1u5ptay/yw==
X-Received: by 2002:a05:6a00:928d:b0:881:b008:12dc with SMTP id
 d2e1a72fcca58-88af6d23112mr6680413b3a.51.1791076109507; Sat, 03 Oct 2026
 18:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814043028.12548-1-phucduc.bui@gmail.com> <aro6C_SWBGF44z5E@black.igk.intel.com>
In-Reply-To: <aro6C_SWBGF44z5E@black.igk.intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 4 Oct 2026 08:08:18 +0700
X-Gm-Features: AclHuK9IG0a55vjRJ0Ls9cn7wrTw42YZDJM-IfJVm55MhbZJ8YTIhAXFCbeNeC4
Message-ID: <CAABR9nEmXm2UwOWHDR2=A_62LuFxjgN4En=8Jcn2r_on0XmROA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for pointing me to the discussion.

>
> Have you read the discussion [1]?
> It would be better to make platform_get_irq_optional() to be actually opt=
ional.
>
> [1]: https://lore.kernel.org/lkml/20220212201631.12648-1-s.shtylyov@omp.r=
u/
>

However, Regardless of how the API might be redesigned in the future
to return 0
or negative error codes, the fundamental requirement at the driver
level remains
the same: real errors must be propagated properly.

This patch isn't concerned with the API style discussion, but rather
with ensuring
that driver probe doesn't silently swallow genuine errors like =E2=81=A0-EP=
ROBE_DEFER=E2=81=A0.
Proper error reporting is necessary under any reasonable API design.

Best regards
Phuc
