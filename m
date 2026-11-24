Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528186;
	b=L74Ou9baIX8CbqIV83VxdTEuUVDnz5GHRi+rYffPDz4yvaI/mCIwKkJsKWt0JnRZjUhf
	 TXHPvwMPZuDWHAmVGe63z7jyN+jKL6fkwGk27qzCQUrkDpT2Mm6Nr14+A6Rx9usD6BFoY
	 oaTQ4Xs631rWsH8RQEK7+6726D+0pdBNPFmc2kLDRzQrj6w1+Js5DtNg8qne3luNHOhSD
	 qIVL2KeJdWWVQXB9E+o5SwwVRUeHaU8q+g/TxRq0ZqBYgVB8Fk4yctKSvGS0XgHelrLN6
	 tQUau83JtBsVpfuYPtlpE7h91zKc9xo0KXcs1MxNZ7gtdxh2OMvYFoXPAkzdVlZF5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528186;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=6U/OwHChsNcDRfDm5EECLX0c4S2IUBr//C7iLQ+0mnc=;
	b=m8JNuhHdDbzLZ6ridlXV2xvRh/MoFrtQ4m/teBlBxItbzIRjMJqcad9c9Q0TNaY0tzk6
	 Mg4EgmWxHGBy6SrYfhK4BAQdTMMZ05nskik0nJ/ZJcUIVCxX45HX5do5D59O0cZZp2jIj
	 IyFi5TsTAo/PI4UTAWlv00NxXgnpQHTAomf9oCMl+yLO4JVQG1suhVVE+fAPLvHXdwNn9
	 TJWj0BAJQZPhacb6aAYlaWLSPl26CzsgLrtaohycapHDmEuY+FBteSJXARA47uAJUBIlT
	 Iy174uBqbpJBvefARGuacaTtePCvifBLbxN+y6Z3cgjVR6BaXzA5oknmht2z5TbZPug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=OrDcgezg;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H5k0Gcfy;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993A606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D993A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=OrDcgezg;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H5k0Gcfy
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id CD9CAEC0A8F
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 08:49:44 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 08:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795528180;
	 x=1795614580; bh=6U/OwHChsNcDRfDm5EECLX0c4S2IUBr//C7iLQ+0mnc=; b=
	OrDcgezgzp3P7rZNn0icQfm3+7AeXK5KXjreyg54WU5t8/DpEYuD/hTusEbq8vf0
	hU6VYEB22SbgnsIaeZXcFO7oosKt7zn617G26cfK2QCALHJ3Be/1r+6CEoEveZFQ
	RnxF54vQ+6zZ68TmCViWvuyUF2B3UjeUfpMd70Q7zizFHWIOZRiP7KJOqW8TfC6d
	xhL5Ltvh8qBsdBVaCPEJUfF70KPqVRL3MyLvcYXRwrNzXXwkDBg0m6Bk2fyylZ/g
	oHDsgxihZF7FUvKSLCXXJVQXJjpmFcR3szxo8gGldFDaZSUknL6xxxsl50wIqLxy
	bi/JAplFtSfNH3ymZHNcgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795528180; x=
	1795614580; bh=6U/OwHChsNcDRfDm5EECLX0c4S2IUBr//C7iLQ+0mnc=; b=H
	5k0GcfyvxmxjpcTOJZ2J2p7mPpZj2w37IZZbHEJWOwnS6IYUraxuegTrHXNDr6Bg
	mwHff2P0KZBxqAedPp9VCE51twQRSwEXdiCMVnwr1ThhW4S7DlXKLPmeYff8g+X3
	BxpgH3SyzPq+Q2GR6eICmI9n1akxV88S0BjEqgISH2MlA2ahmUJ8RcHf0py3MTr4
	yF9+aUCLnjS+WdxTAx+pAxQWQiD8XgIPE3HWSxXPDR/UiKiDQg0omDqyUy6Jdv9X
	7v6XeafNFOFyzekMzVdD14IvVqYwYraALsmcjo3WjlQZpGpUpS0zlcLu1v7dPkTa
	MHrGSTYUhrVceEApAiMyQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795528180; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:KdwXcORzML2sAVeuj6qxJt7aW3wd1y1viDqCO4dj1LOeglL
	uMb+dmHwHPkGrYI1K8+Gx+X/YS+kgYE0yaW3LG+ZtsBcYBknQU0WWWLSIADNBisd
	EedqSf9NxGAKlu1gSDGpFO0Cj9vzlHulpuNIvoDzpd0Kf/DiJ5bF1WIRSRPPTVKz
	8L9+CEvQcBQQjsbrJD90bawo2atuGNhC01LYF+t2wc/9kZlzHploA4Mwy+8rsawt
	bLAF83unAwTbITNFcEzEv9LswXaTDswFjdJDDyViD6/vwopJBXeylTtvXbvsLMWT
	gGZ7jNEjA0jRnOl+Eg8ZArIcbPa63iC3xsSzA8w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bHPVDE4sAhsfTExn6I6mvKQo446Fnbva2QovsMZJtCM=:P4U7GkhU5xBY5K6QkoUpEktFhdGgeBJyWUjA8QPuHzQ=;
X-ME-Sender: <xms:8JUFaxFjhCxGRsZyAVa_zNS6dI3hYxbtmj2CVS6CH_-yKHXQMllqvg>
    <xme:8JUFaxJImtISZiVufcPjvfbEXK1ov93OacPgSQKlp9tPmQ3WwYBWdZOTiyrK5d1ii
    livMen5xmRDAcV2hLdCxHxqRXXWq4Szosdtuce883ngnIczI0x9Og>
X-ME-Proxy-Cause: dmFkZTGExahxJEduJZtgRymrjr/CHAH83ZJQhJ+pO2cID4QhAIVINdkSIFHdeCeSnul4RG
    kWr7IHiFNjEb6+8OKIGo/rP8C1KPHmdPrdONjxj+7QyBVRrodYgWs4RJdmhto/XKzYqraT
    yBnRMY+rV9s0MmZroxT5Wy5w8rHydxSQu7bJKD4ZDMe9IdopunnP+Kh+0TybIqnL2NioDl
    U57yYo4wVQx8dfwpWAQiXO756xzmsL11xVqL/V5alSFKsk6xqEta32zX8ErfIwVDaoGeaf
    CLL2jvN79nY4/DL2n4yO8HnEEHN1IS6dprR3mHYkQRPX3kolGPCfIZyzFhhN2cuXKnqvH/
    RgeMG5fRSsqFKDKf8a3u1rZkgUi5L9h7zs1lOsHe/iWeigNnDpWG5ygSOQKh2CP1S2DZxn
    IiakcTrr0DjCxKizADN3oouo0Da05G3jx8ay5OQLXsXLAO5/Rn37WcHHIZaU8CKNt9zLZY
    KAQarpysn1x8rCMtzmLIuQtFLchU6E9Af/HuTMP7AHvgMg3edxVmnVDQtwozTKxoolBHqO
    2mas7AwVfpF931tZxG1rZPenagJKlnQHJK9kiauD3C3jZXvHdSS4r9sG8Zm57vZTbx+6cm
    i31BcG4daWVGjTrlDRxY28X6aBuYshuamAlvRYgDIg7cPPvDOPv949f3lgQg
X-ME-Proxy: <xmx:8pUFa20N-9GNkl7Sm0GJ0CgtGI5PMuqiKghG77mEashfWrCbqs8V-A>
    <xmx:8pUFaze6pWMwB9nxhANBQqkAQJqpsevOMbW_sT_QJElurpubAhWbYg>
    <xmx:8pUFa1BTWFzVHSwdgALZNChck57mZ07ov4ohsa73NcmJOP2y3JK83Q>
    <xmx:8pUFay99nPWq1bX2rjQ00rwFKQ2MH8tE9UQohDf7jtKxt-jcr28q7A>
    <xmx:9JUFa7RwQ0X3i-bhv2mxBo1uFwyWUzlPT-m2DmvuEAJjDgVAPmSk6vry>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 360D932A00A0; Tue, 24 Nov 2026 08:49:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AS3EG-ulzzHR
Date: Tue, 24 Nov 2026 14:49:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Kent Gibson" <warthog618@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-wireless@vger.kernel.org
Message-Id: <d9c9cd61-e489-4aec-ad37-5e2a2fdbb9a8@app.fastmail.com>
In-Reply-To: 
 <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
References: <20261123085723.156933-1-arnd@kernel.org>
 <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq>
 <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix>
 <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com>
 <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026, at 16:41, Bartosz Golaszewski wrote:
> On Mon, Nov 23, 2026 at 04:24:49PM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 23, 2026, at 16:08, Bartosz Golaszewski wrote:
>> > On Mon, Nov 23, 2026 at 03:59:24PM +0100, Bartosz Golaszewski wrote:
>> >> On Mon, Nov 23, 2026 at 09:57:21AM +0100, Arnd Bergmann wrote:
>> >> >=20
>> >> > This was planned for 7.3 originally[1], but kept conflicting with
>> >> > ongoing cleanups for the broken rsk7203 board. I've skipped the
>> >> > oneline rsk change now, which will be fixed properly by Dmitry's
>> >> > patch [2].
>> >>=20
>> > Sashiko is right:
>> >
>> >   CC      arch/sh/boards/mach-rsk/devices-rsk7203.o
>> > arch/sh/boards/mach-rsk/devices-rsk7203.c: In function=20
>> > =E2=80=98rsk7203_devices_setup=E2=80=99:
>> > arch/sh/boards/mach-rsk/devices-rsk7203.c:127:9: error: implicit=20
>> > declaration of function =E2=80=98gpio_request=E2=80=99; did you mea=
n =E2=80=98symbol_request=E2=80=99?=20
>> > [-Wimplicit-function-declaration]
>> >   127 |         gpio_request(GPIO_FN_TXD0, NULL);
>> >       |         ^~~~~~~~~~~~
>> >       |         symbol_request
>>=20
>> Yes, this just seemed the easiest way out to avoid clashing with Dmit=
ry's
>> patches again. If you want the version that doesn't break the build,
>> you can still apply v7 [1], but that likely means his series has go
>> through another revision to undo my change and remove the linux/gpio/=
legacy.h
>> inclusion.
>
> Can I apply v7 and provide it to the SH maintainers on an immutable
> branch?

I think that would add even more complication. I'd suggest you take
just the first patch now to get that out of the way, and I'll once
more split up the remaining patch 2 in the hope of shrinking it
to the point of losing the dependencies for 7.6.

     Arnd
