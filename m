Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA32ED3A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665255; cv=none; b=L8UrOcZ59UjAtZl39AHWCx15ScLzJTYvGsfxl/7mOxoXQmvmxDj+SQWafyoLdBohdiom1oMb0ZReER92Pm+Vk4/5Q0wfXlecOGiXpODJghyMtp0GRufFo1gY3OGnALbSOcByr2Uy7VuYG0HaQ2udHbt+hY4PmgqGshsNefmhXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665255; c=relaxed/simple;
	bh=TQcE4I7a26JOWNDiOJIzicoAuPbABPsRBghVnDCVJxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHQ8yMnl5O4vATcjQ242IDoyEqKicwczAzuWEr0Gtd0A0kGscuCaSHnEbnUk+wX0+Tn3LF+Rkb8VDBNQJKrLm2l03vL26u3UQ2JZ5U2LKM+cP1MfSlA3bUO964o2jGDqNTLpqd6c7OamadKaVL7C0MkM6v6Sz/t04qrwzdwZIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TfjNU0Nb; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TfjNU0Nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1775665242; x=1775924442;
	bh=XPfSrkA3oWaereGY87hv+CZguWsStb8s1KaSAeumLTs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TfjNU0NbuIv97qPJooiCaxFb8SY2CuZxK18iIECmkO0npSF/huvS1AXIgGaCr5dX8
	 cE0Im4mcrEM4qT5DSsDxSsvVU+6VkSd4vmQCHfF4S7EAwJYpKK6KVIB/WMejKMDRlx
	 0FvyV1pjk1z6q/JYGCc92ryutl9AwrNRlhLJ7TXseJYSJuDP+mdlDNjEyzisjhOeDE
	 nwrHRA8OjoNzurmDkwneIkQwfAj0P3UMaZF6j3hkRuUyZwUAUICrj9wIozlev4lA46
	 LBc9xthE4zX9ywlx9v0a3rFKByOm6QTiJqmIk0DxSXLTtk7rr7WLkmZNR1tfa6xOhq
	 fKFCynIfmOiUg==
Date: Wed, 08 Apr 2026 16:20:36 +0000
To: Vincent Fazio <vfazio@xes-inc.com>
From: 4fqr <4fqr@proton.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Fazio <vfazio@gmail.com>
Subject: RE: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Message-ID: <5W3WCdaDvZ0IgSSsb6LUakqzbZhiNPPBIMH3bjGtS3fHQbiY5PytUPXeVxqfRFuY7tAowBuh_lT2VVygb6mULr4Yk1chnzrXoC-hKTnyj44=@proton.me>
In-Reply-To: <PH1P110MB1603099998E166048F432FE29F5BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com> <PH1P110MB1603099998E166048F432FE29F5BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Feedback-ID: 175532996:user:proton
X-Pm-Message-ID: 3dca644bd731a4a85c89508f8daa9f205deef8af
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

hey everyone,

just saw the patch series. thanks for taking my report seriously and gettin=
g the fixes in.

vincent, seeing the tests pass on all python versions was a good feeling

bartosz, appreciate you giving credit even with the "maybe ai" note. the ai=
 just helped me write it up along with confirming the bugs i found. so yes,=
 i did use AI. but nonetheless, glad to help! you've been great.
looking forward for more contributions :)


                          - 4fqr
