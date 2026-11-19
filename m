Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094754;
	b=ZOhU8cGGxeMrIR9gvwumLc0nbkWQH6PZ9UNfIt6Qc2kyGU0N2JRreL4ZscoXBfXxUbQu
	 sol+ifj/xUKZuWSGBMnlilsU/yxyO3RocljyjCRAyqvN8EQNl7bShoOjHxG+K3Bv2gKW2
	 WPz/TqjI1WhkUoXlmZxW8Fnlg0lKdNBXdj19feX2GFD377zB1RI9je4QVHRgKpx/PQiLG
	 uoa6pYC9AyuG9scwZIbgiK3iFg5xmBSpu6QkltpaP+4YlYxppDoOolMPNtnpYpzep4+yd
	 33XKWLSSKNTvciS2sMTw3ms8mKLEOOjIlGXc8rFVMHxunKsLCLTAhGLZ961+EFb/0TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6GtMGZ1q6ZRXofGUkEkZymFWRF+bA/VpHBqpwylrFKI=;
	b=f/iyBvWg0HCcZMH0bfMGUdXM6DoYJfVE5Hf9WRiEB3YYodjx0pcn9QrQyCWT9Lzc/9U4
	 e1MY8jtLXFM7PRuYmEqACVg9vfTnMAdN+HqCw1kLDrPI9md77Cc8AGWn9ls7vsTpP7518
	 JPDYnLqU8xzku1OMEoLvD+Ukx4Z3OLSfNBxgeYHrsapTsWpbuG8U7/RDQBeEp99JvCLw1
	 KsXtqSqj4jEaP2vV9P07T1F7QW+XglnUHmb/LUJ6tQ+/sUK58J0vDPwjsqijby62VOLUc
	 5A7sKh+M49ClBaB/y8rcEErnhZlXYv8g+YHDVZa/339SbmY+pYxKDehX4G3Pq+J8zPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJMQXDYB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF98606A339
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 13:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF98606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJMQXDYB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-381d542bc29so4081660eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 05:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795094753; cv=none;
        d=google.com; s=arc-20260327;
        b=CvGKPU+PjDXpVsMnJhurJN301qFQY10vVW9P4jcBYH6FbGHlho2vqnATSdRFLi3Ciw
         MNk4jxnxq3dIhql2rjNK+3D7yjkwq2Lk9ycJGwmZ1ovMQJLHhb4gTTd+ZBmiybxdoD1L
         JqMUai7L+Zt3zXjOdxmTdPC0tSugS5PVrUZSPLrQWfj9JXthXWosJUXW0uCvzOhRmlV0
         6g/ALpTyTP6kfV4BzT4nCisUrKWuahaWGfAth6UAfSxhHI+RdPv+Fj87rV0qOrpRVt8K
         33n84cjzr4bjIE5xvpGiHg5YG09OAmq34Oul77Yehg/4USYCKSg9b6gBOoQx9Ar6sg6q
         +dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6GtMGZ1q6ZRXofGUkEkZymFWRF+bA/VpHBqpwylrFKI=;
        fh=2eOACZe+kqUxFKMbhJ37DT9x9kRmQ3L8aLpYYqQqDfk=;
        b=q3v/bFDdxSZKdGXr39DT/6GmeuLd2Saq8FOwasM4WcCKGub/6RdomaOgnjgRucE3sV
         3LoegDwPqYJ+L3B+5c20U36lWyzqNqCpnI23rBeRodWFdS7s72ZMcFl2Y05otp9+EX2e
         d1bk5jFQXJ14jOG/0ZrjSbguzt6dV9lGMexXXwUZJwniGH0DKcoAYAZSxh5QfAdmK4NT
         D7awrVsdZM0JRJl8X/9gN6bGAPUJ54NgNfULL4Im5Bhgh/lnxAwTbx0gX6VYvx3ylJG5
         k7SDw+rz9nb6bnceh+Bvl7x5SQxIuCowbsIBu6cLdjnG1csgd25VHvU5MiAmOsZGDtpB
         QyWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094753; x=1795699553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GtMGZ1q6ZRXofGUkEkZymFWRF+bA/VpHBqpwylrFKI=;
        b=TJMQXDYBn44SkcrOW0pJGHN1bwblMduilNfFQcl3U1t6UyvvjA8TCLslSJkdUvfZIy
         KpXYZege3j2yJiou/fqKzS+rQ3KukR1pynvmd0C6JjEJ+AfeD4hrPSgiYxC/3BCGLUNT
         dUWhRhSYsoY6FC8dWVsLMLbZC7pcRNXO4YxXhqOexPvGQ+Ma2E0e14RUhjJilU3vXOdn
         gE25TfkBGvUlR9CYiuoIiIDr7tLwGLc6rWrvwbH7M3RBHAO0d419hcoA5o7N2Mb0oUYD
         oAzCDw0WZCK+d2M3yjlhn7yrJ2OsPdAmn1ncOZLlJaBB8XWvNI8+yVUkaYjphLM9wo36
         KKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094753; x=1795699553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GtMGZ1q6ZRXofGUkEkZymFWRF+bA/VpHBqpwylrFKI=;
        b=tO+jSLtf7uQo0yJr08k1r3KlW6z6hnibciCFe++4/6t2dp++BFkYb6J51HV/2CW8+N
         +mKA0+sLbsZLJbNXuPsWjVKclySZbG79B+95Ef7iV27/CwaCzp9rG4Ta4XzSnKAlr+0J
         q0697Y9Xn49Y50zd/opk8/p94QaVu/1F+TI5hi8WeeKQFet7mmDq2Tf8LIMjPs/mxe3B
         lO36yAg/Ce1hfDr4+Yy2siLSw0TrRAKS0kL4deTJb0aMaGCjaNkes2Eu6V+aoPMfgHSu
         mm2wlVRDEISSE0VVmjnc92kvoCH+7HXtRg+8uPtFscg5UdGdG0IG/Xosd+Y9fC5HAGmv
         Ypdg==
X-Forwarded-Encrypted: i=1; AL+hErGvqlFJlbxcMCBxqeBQwN9bVLcggfwq0aOgl+A7t4oPiIOMHdm/y/IuNZRE4I5U9MYSntjUjIGqpIfI@vger.kernel.org
X-Gm-Message-State: APuU4Z8j5KoDsyvovGASyU6lQxD4Nxl84/EUexCJJJDybfFatP+16qnG
	F1dQEjSeAx4BI9JO6uLpwukhwCzVzGr9u+EVIwt73vOLekbAL2jL3JDOyxrV8oDjTGq+nLb0X3b
	qd5OJm2xqsSFag+JLik9TiL/ncCmlNCA=
X-Gm-Gg: AZFdTZf4AQ85uLvnCGNIJ0jp1nKIyyT8wEvE7JGmV4TFohr06uffQBKpvvYQxyzNlnR
	RQdhDeR7FZOcOyjbPmLP5TiUhJK8eoXTeBeOcjAtPVV00WSfE6GTJJKCUZzTpHoRvlRJHAE7xbw
	feX6hHh1fgoNKEfCxUchNuaD0yWpSowurCkG4ZsoOppOpnqwdFUuZsHbq23i8XRdiSw0wAifWNo
	x9be+HpclI1ZhcbXbAZyUh4Pp+84I9gKiuHWuOOJCtH6vgoNZrqfZIRGO8ELSY3E3UMX+aGwK4U
	ZYP0D8y2E3At/lO+C/Q710WdGIdG43vTSkCeC0X5EOYPyaYjxxj+vyYB4dQ0A10lhsrTDttqaly
	9dRoBrQnupxEdHqxT51S2XpB2PEycLeH3xWXkdW5IvQEMMuOyxtI3IdtuJ1Q2uNfzLbjJ
X-Received: by 2002:a05:7300:fe4b:b0:378:7434:a526 with SMTP id
 5a478bee46e88-3828036f384mr5352568eec.14.1795094752653; Thu, 19 Nov 2026
 05:25:52 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117104110.240112-1-hj351016@gmail.com> <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
 <CAGr5VtPJq10ZZoF71+714xrkC_-3g5JAEKfXXXx+6MEY3PN6bw@mail.gmail.com>
In-Reply-To: <CAGr5VtPJq10ZZoF71+714xrkC_-3g5JAEKfXXXx+6MEY3PN6bw@mail.gmail.com>
From: khj <hj351016@gmail.com>
Date: Thu, 19 Nov 2026 22:25:39 +0900
X-Gm-Features: Aa3M54rnPhZAKuEY9k2UmBknHhatG2W7IQACaSMZC7nT1gke2LYNilinggjycdY
Message-ID: <CAGr5VtP6AsETHHMGuhsycLy2Mq0z1Z-Jt5UF+W5_XBcbL=dKfA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mary Strodl <mstrodl@csh.rit.edu>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, wrong thread - that reply was meant for an unrelated usbtmc
patch. Nothing to do here, the mpsse one is fine as applied.

Hyunjung

2026=EB=85=84 11=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:23,=
 khj <hj351016@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> You're right, sorry for the noise..!
>
> buffer[2] is only read when there's no interrupt-in endpoint, so
> rejecting every short transfer would break the devices that get the
> status byte from the notification instead. Dropping the patch, I don't
> have the hardware to test a narrower fix..
>
> Hyunjung
>
> 2026=EB=85=84 11=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 7:33=
, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> >
> >
> > On Tue, 17 Nov 2026 19:41:10 +0900, Hyunjung Ko wrote:
> > > mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
> > > len_actual - 2 bytes to the caller. A device that declares a bulk-in
> > > endpoint with wMaxPacketSize 1 completes the read with len_actual 1, =
so
> > > the copy length becomes -1 and memcpy() runs far past the one byte
> > > buffer on the caller's stack and past bulk_in_buf:
> > >
> > >   memcpy: detected buffer overflow: 18446744073709551615 byte write o=
f buffer size 1
> > >   WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
> > >   Call Trace:
> > >    __fortify_panic+0xd/0x10
> > >    gpio_mpsse_get_multiple+0x767/0x780
> > >    gpio_mpsse_gpio_get+0xa2/0xf0
> > >    gpiod_get_raw_value_commit+0xf8/0x1f0
> > >    gpiod_get_value_cansleep+0x1e/0xa0
> > >    value_show+0x42/0x90
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
> >       https://git.kernel.org/brgl/c/f94f85f82e042c89a1e64ed3ff1d591a2bc=
cfa7b
> >
> > Best regards,
> > --
> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
