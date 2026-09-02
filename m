Received: from send215.i.mail.ru (send215.i.mail.ru [95.163.59.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580D14756AE;
	Wed,  2 Sep 2026 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354150; cv=none; b=mubMKrhCpvAENjzhLVPBUmMn1ftqtKGNkHCCg4tiLZ+yI61PZNPUOBwM5wJu2mKC8W0IXeSpTaT6KH3QITmp9XQ8vW+PrQT441uTeE8oc/R55oeNxi6vwKLijuIeWQuojOpFCfgzYn9lxIpeLAw9QYMB+hDgaIsXTQzE3zEEZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354150; c=relaxed/simple;
	bh=ntiAZMD3KZ8erQc+DkVstGfXcUbngsrxoCjqBW1N/DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHG0NgGLfVUiXhiu8xYNPmDvH5UeczqrM+EdG8beyPBW0PVSGw/CLT6g1iU/tLMkKfYahrP2XHemrJDSVBXWBEuosolO/FOToaSI+0XiupjqwAofiegylS9Ic0SBW1W4Rugy5vXvCf/q39eGP+DX1W1N2hcS/XfOAISMQYT04F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=VdhLzq5W; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=yfgQmgbO; arc=none smtp.client-ip=95.163.59.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="VdhLzq5W";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="yfgQmgbO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=pqc1njqNvJjr4zLoANzy2eYbjTbv/3UL8ll0iKhJtp4=; t=1788354145; x=1788444145; 
	b=VdhLzq5Wjme5ZDltBiXqjTE5ul6oi4DIwy7PM7rvhNyIwxrZ3um5yYX3r7Khyrn9mkcRAQNGyK+
	10m3D92h8VRqz8k9u43q64wsCkf1GxI8I+aeCQWYUdhm6VEQ4RPPzqc058mjFmlY4PpUy2As7WfZu
	KPWm2xXosr2e44KGsgK1SkT7QgpycYG1Srd1rHcdyjJUT0uvoy2cKuR/WCbhDr0DsIl2It3xxbbv3
	0IZT5+8f9DVTj13+ihYGCUMt19/Q7j/eMe/r3ThlxPSD25pdcldrykxZrXJvaq0fD8kgse6WFXl8H
	84hQgvtc+QAgdeve3GXIsaxs+9KG9NnHVAfA==;
Received: from [10.113.70.73] (port=41308 helo=send175.i.mail.ru)
	by exim-fallback-7f8cbff86b-5s8cg with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1x1kbZ-00000000XOY-0STV; Wed, 02 Sep 2026 16:02:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=pqc1njqNvJjr4zLoANzy2eYbjTbv/3UL8ll0iKhJtp4=; t=1788354137; x=1788444137; 
	b=yfgQmgbO+9nHf3TXP0VIWtIHupPEZGH9kL5RJVx0Yvcp/Nkk2r3YAkwhQw/MkLYX+CqMwGIGFIP
	WglbSXLXldaoeAUT2HX2Yxj0YM6qvrY7Xe5jAnJpnVpkmAShwESRvrfkNJIjtKWqChhHny1wMRoVt
	cv5vCfHyWvWNh3ilT9DwEz4n80/X0X7snIxCAfiGBqc0vPozQ5Bj0i5cLSAuEsKgRUBYA4iAa1+E6
	lKGFjZpaLXbQf4LB5fEHtNInGEN1XqWlBkAaKsiixKWeJ/7/YwNc72AaNO+fPB+GVo8oPXMZ9UYjh
	3xLyCznN7sVxkP6OJ8JecfD2lsivWZ+ilnlQ==;
Received: by exim-smtp-757496ddbf-6qc6q with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1x1kbM-00000000Kbu-2GPu; Wed, 02 Sep 2026 16:02:05 +0300
Date: Wed, 2 Sep 2026 20:02:01 +0700
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] gpio: realtek-otto: add pinctrl support
Message-ID: <apgeSVMUQlwqFGEa@gamepc>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
 <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
 <CAMRc=Mf16PBE0=Udm+A--i2d1VoZCEC1=LNC2q=t8BwqtgZY0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf16PBE0=Udm+A--i2d1VoZCEC1=LNC2q=t8BwqtgZY0g@mail.gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9387412590C6CEEC5715D4EE88C02F82AD2A70591BAD8F65A182A05F5380850404C228DA9ACA6FE277F024849380066F93DE06ABAFEAF670556EE6791AD71D35ABC7A4E1011821F469A2121EFDC19030F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE771540F9ECFC94C4BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566301367915B30F92B02AD4473C94D325EBD45CA407DA4317575269500DD1140958EEF46B7454FC60B9742502CCDD46D0D4E7D9683544204AFF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249957A4DEDD2346B42CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0A3E989B1926288338941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD26923F8577A6DFFEA7CFF8F0A20C233E3717B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050FB89ED3C7A62817817AAF5A6EB0CB4C2AB3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE33AC447995A7AD182BEBFE083D3B9BA73A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493D7D0D17C1307CB5D8734EF69C36C4A4DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5123735682FC30A215002B1117B3ED6966BE39FEDF65B3C71C81EEE05487B02093610D81D389A125CDE35189EBF2DEA28FEA14CD2CD220BB99C5DF10A05D560A9880EC71AF561E0AAD9143641EC25BB391E6C9033E69DC777
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F96AB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659C5B0F10858F74F3AA1F95D5E344DB668BBC1349F4795991FA651DC25379B432F7278F2FB9AF9A9F8B8341EE9D5BE9A0A39EAA2D944F5B77C2685C6ADB44A9EE2D8F1DD5F367D189A52EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWMcan1zSnA47m5/lFOSIJYM=
X-Mailru-Sender: FD65D7C492470CAE8C4B13F0F0107C4875BB3A06A4E3D9BD08AF9BFB128101EEBBFBD52784DBB5FBC313ED024E1BF76DF767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4E68D82DDD6F26AB2F623B7C9E701E813A31BCB2A4527A033B647ED114AB003AC4383F931CB88914956704ABB56AC4A0F4F43C29B2AA09AF0D44913394EBA3C7712A71D94769628CA
X-7FA49CB5: 0D63561A33F958A59A96A8F04BBE009E5002B1117B3ED696728180772ED4728A4BE7A2D7F647BB5802ED4CEA229C1FA827C277FBC8AE2E8B6B3B7BB21660B6C7
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpLaIlvAR6h4id02YH9mgeCTAyYoNlVO8a2O0C7eL3eW8C1sEdUL7ZkY=
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

On Wed, Sep 02, 2026 at 11:27:50AM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 27, 2026 at 4:29 PM Michael Zavertkin
> <misha.zavertkin@mail.ru> wrote:
> >
> > RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
> > for GPIO.
> > pinctrl driver for other SoCs might be implemented later.
> >
> 
> So for now shouldn't you make it conditional on the compatible for
> this one model?
> 
> Bart

It might, but enabling it for all will spare time if/when pin
controllers for other SoCs will be implemented. And it doesn't change
anything if pinctrl not enabled/provided for them.

