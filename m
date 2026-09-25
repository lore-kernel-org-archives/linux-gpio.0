Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F58D3A48C8;
	Fri, 25 Sep 2026 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359603; cv=none; b=owok7K9LcwHv1ylWUcnwlOv3wmIGiYGok2juL/m+jzicPJWnbiOmyxaSRaeZlkuI9yG6xTorMnOBVYzBIRX61ZceQUZ0m7KknuHA7kL5P/sdKxnCt4vIXJNhrbTIYN2Pa0BRiQbhetnd8Zr6/AlO8xfra5OPwqAZlAmocAZ4wH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359603; c=relaxed/simple;
	bh=lFdHUz/YXg8928e5rXh6lIOdk84HmMBqaJamjPVNsaQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mz1Ihq3bH5lasVn1YU6oHJrletBUyvahgflpbyGReQNqx4g0u5eygw2er/BU21AqDsqMkdqGgrhGK5wpkGfHXYen19tflAamYWm+6x925vgMR86QeZSOLpPRoGKMBuHwhyORfzcPkCYu6XI4/YiDwOTZDqcWxhIRmU+mfAdIaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=oqj3bNSm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gRoEaHUA; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oqj3bNSm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gRoEaHUA"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id E0ABC1D000D3;
	Fri, 25 Sep 2026 14:06:39 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 14:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790359599;
	 x=1790445999; bh=9Ylyed5OqVOYlHOixWhJKkwJZx2QMvf1xxN6LkTNZMw=; b=
	oqj3bNSm5/+RUjvc0izGdF0csv8FD/95sztwKKAT8FVFZ20bBK+5mNONOcMyXNbX
	TQlkVvpccb/tB+48CxuEJ9Ad5LqyToAjFBQyw7cwXwwUVTcrgS0QJ4U/22g2nSKx
	q5J7kB59FAswU7hauCwSZp7UAw0SFitNauUe6DqhWGxDm1B8FFFvbI9ljNbeBlUP
	SQqDuxKnogfskEP0OwSUKMnN7DlPVk62xRODACAo/XZCtf6bXxNZEtTfTYBoFq0H
	9ts8BpBmMDvo2Cg/ygkxlR4Zm8t5JZwSIq2gUbNBK4DiXsvVlBXDlkiT75mUpiIN
	y51I7ZrGO6zYKG8tJuco+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790359599; x=
	1790445999; bh=9Ylyed5OqVOYlHOixWhJKkwJZx2QMvf1xxN6LkTNZMw=; b=g
	RoEaHUAJPKK3bQ/OFkPt/gkGZLenwX2FDMgWOhbmrNz1/lT8dL//++n2FnOXQBN9
	INOR4SCXMTDHMA/yQCgf7TkICyX4mB9WISD8FgOwC4d3VsBqPJGJeb5jFdxZQbLf
	T+q3lfLUFiVdslOdDoErwCNlRt8GcxgHc6k+YJ27HQ8ezLsTnQgydI5qMSfAxNqp
	LDMeAgOWLkqnaGlYjaqPY4JZtvMdfd+v0Y/43FHV2M2QCyzmvx071OWpDoT7Gn/E
	yEgop0MrwS+m+9b2mUGc0FtpX37DbQF4qyPSFKCZ46Ytx+LdLhlppM/kvw9iV7P6
	jJMx9stG4hkMVFnjKAg0A==
X-ME-Sender: <xms:LLi2ahuo03EU77UE4RT-dso2aLBglDxQLwoIWTXpWd-_BNfimv3NtA>
    <xme:LLi2alSpmd5PZtutCGy2qx0ambzLp0oI7qYRL5yN7kIEs21_nYYUMwH6XQhsvhB2X
    4YFlb48o2QgALi2XIk0h_NRbyTxUhBD_rVqY_a1__-WILtdpG_-QwQg>
X-ME-Proxy-Cause: dmFkZTGTBN9eglf5NAmA9M5kVDlLBCCpBG3DwqfRcLCeReO9u8I10+5FWlsKtpNliiCaMb
    jvPnigKJRufKNQyyaC35yap3RBBcUDo3mqVYNwImznOjJIogX91Oq6OLMY7bea0JwQn0dW
    NY9RdwC+qVCcDJltIwbVs+1tGuffVAydTWDtthWd0ibS2xSmuLVKzMlDqYEjrgpEf025Bz
    9QbSPMQQTlYc1C1a1qWxf7iuXhuE/EaSXmrNnAw+0Ms3OTSvOmji3aRRgBmjiGmHMTxk2A
    B3bR3PlztTUMjlab1lDsUK/b6QRrzQqLh1KUKDpfRqCblxibHzHM+B5YjuHPPT4MmE8FWy
    HSaDqczVyZB4bD3RRcNqHI7mxfmqNh2WarT2ZWFYMytECdj743rA0gucelVG6OIJKLCo0A
    Xje1Jslfp0ybTwl1s/g364NnU+D701dPBr+sPE4NRo8tVI8FJc0BXYlgL3Q+d20i4iG9SY
    YMK4doOQkZys5UHm8ava48rhrrEzzN5ltQKVKP37+1VsR7jyuYHewLaoyNrB/3QSP7P/kV
    Y3zIv0r7VUAQmoYdnukuTrjU6B2UXJl+M97BMp6Z1KGa7XylYGEqZw2ZtOybgJ+nHAQgM+
    vM7UMo+XCsdDJYWALH6rgdj7gCXGucxFWMUD0dvx/4mqFb7ke2luveimAdXw
X-ME-Proxy: <xmx:Lbi2anTGYcbO70-ipJCbJ10W3b3bh-1nG1YpXjTrzPc9nzjaMeGvDA>
    <xmx:Lbi2an2yRmmKWzdj-m3ukuFTNtAkxceBQe2H1-DV0Lv-dduqqxeePg>
    <xmx:Lbi2ajALP9wDnipdwYV96DGnV1nYn8U_5kPREBNa6anchjS6pNFQ6w>
    <xmx:Lbi2ajgBDtBGelA4qvkmaqxx1dOcIxfSAc0jWPxKqA8FXAuGxzWxcw>
    <xmx:L7i2asOu_A55ZwlfUhhq4OMYQtVax3mlf4_66qY4bvx64xMDnc0M25RA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0185532A008A; Fri, 25 Sep 2026 14:06:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AyPHYsJEr0g7
Date: Fri, 25 Sep 2026 20:06:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Mehmet Fide" <mehmet.fide@screeningeagle.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Dan Carpenter" <error27@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <1dd2a465-44ae-4bb0-9cfd-1e06cef5ac9c@app.fastmail.com>
In-Reply-To: 
 <CAD++jLmteSSyzEbfv=mnxBCehZOoDtshskvAhrrVWMXjcFWM=g@mail.gmail.com>
References: <20260925130025.3882279-1-arnd@kernel.org>
 <CAD++jLmteSSyzEbfv=mnxBCehZOoDtshskvAhrrVWMXjcFWM=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix CONFIG_PINCTRL=n build failure
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026, at 18:14, Linus Walleij wrote:
> On Fri, Sep 25, 2026 at 3:00=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> If pinctrl/consumer.h is included before linux/errno.h, the missing
>> error number macros cause a build failure:
>>
>> In file included from drivers/gpu/drm/tilcdc/tilcdc_drv.c:9:
>> include/linux/pinctrl/consumer.h:110:10: error: use of undeclared ide=
ntifier 'ENOTSUPP'
>>   110 |         return -ENOTSUPP;
>>       |                 ^~~~~~~~
>>
>> Include linux/errno.h indirectly.
>>
>> Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=3Dn gpio confi=
g stubs return -ENOTSUPP")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I think this is already fixed by:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.g=
it/commit/?id=3Dc2d996d9c6dab31ae41d19507c2b7ef8dbc14602

Right, I was still on yesterday's linux-next, so I did not see that.

      Arnd
