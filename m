Received: from send262.i.mail.ru (send262.i.mail.ru [95.163.59.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09675476681;
	Thu, 27 Aug 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841903; cv=none; b=O0njd+U+eOaV4xSYyr6r/thctMbFUy5eXAiGk5nsaMzR9a1sL1fPfh/ODQ8ca8mXjB+KQ0fbCGpyfgQRb2JjeOkh3zxGlBZ4Eg9OIxeON4El+HElagVpIVwGo5oZpT+QDkUZFOr+XWeNTvezkXu9+aCOTdPN8Vbj//VtFWWOOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841903; c=relaxed/simple;
	bh=cIkkvpEGOhGUpjbDEr/MocI3+3RuctkKlirRBbu2GIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nc+0XoBRXNbceKWbKu0ywWEu/5sKa9LQdKLksISiCslfog6nugehK8uaO+Wdm9Kvyv4lHqb54IIGruEMbUHv1EdcRakLaWPigByBoePCcGXbIk5hPd/GQDDQfMshmaYCPccHkVmTZs31a2kgP6lJBxGYgBliN2RshkzgiUe4lzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=1kTZJTtO; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=UnO/a5Ex; arc=none smtp.client-ip=95.163.59.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="1kTZJTtO";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="UnO/a5Ex"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=YDqcHCG2tAlJ/TRRO3dYsd4woH04T36U0aWzTLtmrhU=; t=1787841898; x=1787931898; 
	b=1kTZJTtOGYWv+zcHjQabUlm3q3OHAWe5M4a2kaua3GAxv6QA4vNv2g54hv34zRj9PiTe8MrwAas
	0+uZLGwJEHQb4x7y/QGVM4DeQqgFgBwpCSrOm7fHBXsPzexwPsChpwTCBCic1jG+Nvh/fkBs7aN2v
	uK3ptdDBDr4dfp9AsKDB+HB3tzmZOUA2qjyO1DEt94gGvXrxj3LjWLImw9VmqoCNptsY3bfOEJojg
	kqEfhgOvXYg9fXldkksvm6dCObAUxr7PXgFVdm3eTBzV+hBGt81rm2kgbdsiYH8Cid0/OE2jScCsq
	CwA2VlC6vInea5fC0lvQZ1Pni+AJw3g4+6PQ==;
Received: from [10.113.220.48] (port=36242 helo=send57.i.mail.ru)
	by exim-fallback-cc5d6c65-mgrpd with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wzb6v-00000000ADU-3kMj; Thu, 27 Aug 2026 17:29:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=YDqcHCG2tAlJ/TRRO3dYsd4woH04T36U0aWzTLtmrhU=; t=1787840985; x=1787930985; 
	b=UnO/a5Exj78bw2bpLNyAI6TE1eiboiuqm/ZVeup93/vizSdzQ25Yf6IXMtrjtz1HbxEjXSvkleD
	kviU6mObV0oTjSyetHa9RO9SOFfQwZhlCDpldB/oywvFf/Lv1A1tJPauqkmf9nVGWvmF09jgLi+/s
	aRCh+1uUTKy2PY6R2pDVXm+ZsgkoV0l3gJSqv5odc2jzJCAfG9isJ0L75G7Twkp7mhbosCiaWn7B2
	6Ui1Pv45GnXhnu8E+bmKs9mviUG4JhzzRHEnms75xJik5bMEkjLwIB5kalzMonU7VeKsMpqAiV4WK
	UHb+PDHzGYoxPQ4qZr2lcOFLG6a/M3/X3EUw==;
Received: by exim-smtp-67896c5f6-g5r8h with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wzb6k-000000007wQ-0UOy; Thu, 27 Aug 2026 17:29:34 +0300
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v4 0/2] gpio: realtek-otto: add pinctrl support
Date: Thu, 27 Aug 2026 21:29:29 +0700
Message-ID: <cover.1787830440.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD989EAA21F98EB1A93C4F62F08FE02370DF57FC4A5C5357105182A05F538085040ED4510BBC4F31FF93DE06ABAFEAF6705EF34790FE575E400835677FED89DCEE070FEF0169C8C4278
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BB17EE3498E810FEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B229DB665105243A2C2E070BE324C7D3C471AD9149BE3CAA3CBB0A4F435E46E6718B35066C979671628AA50765F790063783E00425F71A4181389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C068077CCD40B79AC98941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B64280523C145DA091CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249426B02871688330B76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B8064A818594238E23AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4933DA2A60EF0CB5BF9A3CCBC2573AEBDE1C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A57651EFF7ADA3FF425002B1117B3ED696A6E03531CCFD6B88715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD0AA277257C6A5E3DC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659A80F80D0BC0787A0EC2E23E88A39E15754225A924500A8F05886F517A70BD010D07BB4857869232CB8341EE9D5BE9A0A52619171E45DBDE4F9FB1C124AE26B667EFCBF303F1C4F3E52EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqWb9W6V6M+324=
X-Mailru-Sender: FD65D7C492470CAE95745CB8A15E0A69A51BBE932795F37BCC811723C208B4175071A0ABC2F2EAEB59DA4CF581100C5CF767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B44E72EF7427BD9C08E5321CD87E45F530299A788F7545643A049FFFDB7839CE9ED6DF2CF6B6DF36CDC6F8ECFC23AA16883CB64FC8FDF5FCC975D2C50EDD02A7E38E47883AB0FAC18B
X-7FA49CB5: 0D63561A33F958A519AF0F15D771D9685002B1117B3ED696F2EBED46E3DAC62E4565145407275D2102ED4CEA229C1FA827C277FBC8AE2E8B645DA26ECD5ABFFE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZOCqjzNVgV4/nEsClGAFfQg==
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

This series adds pinctrl support for RTL9607C and referes it
in documentation.

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
---
Changes in v4:
- Fixed SoB mismatch
- Link to v3: https://patch.msgid.link/cover.1787209558.git.misha.zavertkin@mail.ru

Changes in v3:
- 'gpio-ranges' is optional in dt-bindings
- pinctrl supported for all SoCs (no-op if disabled in configuration)
- Dropped Reviewed-by (patch changed)
- Link to v2: https://patch.msgid.link/cover.1787130560.git.misha.zavertkin@mail.ru

Changes in v2:
- Add 'required' property to dt-bindings
- Dropped the ellipsis and added Reviewed-by
- Link to v1: https://patch.msgid.link/amRpvtNAwIQak_9y@gamepc
---
Michael Zavertkin (2):
  dt-bindings: gpio: otto-gpio: Add gpio-ranges
  gpio: realtek-otto: add pinctrl support

 .../devicetree/bindings/gpio/realtek,otto-gpio.yaml          | 2 ++
 drivers/gpio/gpio-realtek-otto.c                             | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.54.0

