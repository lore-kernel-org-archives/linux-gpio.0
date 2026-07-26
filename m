Received: from send126.i.mail.ru (send126.i.mail.ru [89.221.237.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79A3BC68A;
	Sun, 26 Jul 2026 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785085414; cv=none; b=PWd147WcZ6rT2Vo6zXEY0v2f7xTKHOdCXTRWZbEGvl/V+sJAHxQVWVxmdRTIxF7jjraqvWBJfCmlC/RQiSQ9xj3BgWNYK8ecyNLdn8tfgMLFdiGJ9GxpZrxVW/XGOZCCGibBFVpvTXF9YxbOHca3oLGrhv16EDcaqjnKztSWm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785085414; c=relaxed/simple;
	bh=vGrIwVOqVeeAqpoxoAmJfl9QjSxoKFJCUBks8Rl4QOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4ZLE5QfN8c7tKW0hPuabru6Qg0mj+zxm+sG643dRjOVADuCDq6fx0TAfi4Yihq+GJTjia6NJxsx8dkwqUafONlnuOs+0cfvZ13Uvgoi0biwKNmcGGP5NQ4xpsl3vgSF+QCT41jv0mX3+EntcZQB3qHy1SfSvKiaqdmjs3yGJSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=eHTODsD8; arc=none smtp.client-ip=89.221.237.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="eHTODsD8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=TNpkyhIqAIc+r/i8Z5DFWA6OooMfd1lbgitOkUZkqPY=; t=1785085410; x=1785175410; 
	b=eHTODsD8RSIDP1OeIL++/RZ+swJLulu84EZCexReFo7u5NwshHVrJNiYhatN02+9ajLN5cIRU0K
	gJhaajZIlwl98aufGF5FS/2xZ27gYa1E1WmWsDSyT/ygOuxEGBp51hpcPhKnGwVAJzgtW4tEGqxhI
	ualC1b/d92yXr8dc6z14+Lj9jsx6fnsbZU0275q2x7AyZTYNHEwNYCyqScDB5Kn7xd6t0gykbH28q
	XT+hsX4PuCJ1cWQwGJjctZT+acdYa/uudX+nKnrRuaqGA0QZpPePn8PHti/eJuGu6Itu/I1WT3UMV
	C2pIXHyyrelQzl5CzQn4D7eP5NL9qAzE2vnw==;
Received: by exim-smtp-6c76488b9f-zvmff with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wo2G1-00000000FVn-1nKk; Sun, 26 Jul 2026 20:03:21 +0300
Date: Mon, 27 Jul 2026 00:03:19 +0700
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: realtek-otto: add pinctrl support
Message-ID: <amY9150CnUEix1-4@gamepc>
References: <amRpvtNAwIQak_9y@gamepc>
 <CAD++jLmXdmgWPenz=2VspSZHa4e7bWYJLyDrWDMjaEXHHKBy7Q@mail.gmail.com>
 <amYl90gvP3QSuTcP@gamepc>
 <CAD++jL=YrcrDBxM0=XZ+w3gUzpFFNvcu7kCsToQtD5NxVBOUOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=YrcrDBxM0=XZ+w3gUzpFFNvcu7kCsToQtD5NxVBOUOQ@mail.gmail.com>
Authentication-Results: exim-smtp-6c76488b9f-zvmff; auth=pass smtp.auth=misha.zavertkin@mail.ru smtp.mailfrom=misha.zavertkin@mail.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701F7F2B1828239C9590C9D8BEA4C3C4F923182A05F538085040919C57C48286B5C03DE06ABAFEAF6705C29650528DA00C97445CB11410701C1D2E7580F92AFCEA56
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75210414551E8CD62EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375666E0AFCC7CBCEC7C7F029A2D67C213CD424339BC041CA3C026A3FACF9CDAB98418EEF46B7454FC60B9742502CCDD46D0D97F6DC7EE186E494117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC3A703B70628EAD7BA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18BDFBBEFFF4125B51D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE4B6963042765DA4BBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B69F5E362153655AB1D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F72BE6798D6036352262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A59EF4AFF49BC7E6755002B1117B3ED696FE0EC86A7A79740692B673A2F5DDD7E7823CB91A9FED034534781492E4B8EEAD37F46C620FF2CAEEBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6598FBE9529F129EF91836EE81D490CF11DB0CCDD3DFD4AAC625BA83DB94E3C750FEAEB1A431DDB9EAFB8341EE9D5BE9A0A2B9EF5C78FEE308E1EFC447900FD8CFFA448303C40D8CE84C7CEAA0681F5848F4C41F94D744909CE2D653CA06E969CEAC4926F5095E487D6D64CFEF34022E96A964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVczkDsfooUjf6jm3/5JP/nU=
X-Mailru-Sender: FD65D7C492470CAE2DCF3D90CEA1D1B210C172EEE9AD4BCCB951B70A5BD4BD8EA31745D63FE2A2113375B3D8D59482FA4B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok

On Sun, Jul 26, 2026 at 06:38:00PM +0200, Linus Walleij wrote:
> On Sun, Jul 26, 2026 at 5:21 PM Michael Zavertkin
> <misha.zavertkin@mail.ru> wrote:
> 
> > Should I also add pinctrl property to required in realtek,otto-gpio.yaml
> > for realtek,rtl9607-gpio?
> 
> What do you mean? You should use gpio-ranges so add that if
> you don't have it already:
> 
> gpio-ranges: true
> 
> After adding appropriate gpio-ranges to your DTS the pin controller
> will become a back-end for the gpio. But certainly you must have
> done that already?
> 
> Yours,
> Linus Walleij
Yes, there is gpio-ranges in .dts I tested.
I meant should correspondig 'required' property be added to
realtek,otto-gpio documentation? Just like that:

--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -40,6 +40,8 @@ properties:

   gpio-controller: true

+  gpio-ranges: false
+
   ngpios:
     minimum: 1
     maximum: 32
@@ -75,6 +77,18 @@ required:
   - "#gpio-cells"
   - gpio-controller

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9607-gpio
+    then:
+      properties:
+        gpio-ranges: true
+      required:
+        - gpio-ranges
+
 additionalProperties: false

 dependencies:

It is required for RTL9607C, otherwise controller won't be connected to
SoC pins and GPIOs won't work.
AFAIK, it should be a separate patch (but same patch series?)
If it's okay, I'll add it to v2
