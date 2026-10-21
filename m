Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575772;
	b=fVgsUo4XK/1H6HkLaxbYb82unljvk+SF6D3WLjYw0fm5SGQo1eQ7nS8BE3SheljfptiS
	 maGNQBfb6gR3to6aVWO1NdwKUHst0F+HBr3SVLQWAh+lILjNLXH4udE4JRz8v2GG+gdKN
	 +bk2oTSTuRYAAcbilBHDFct0ddPCOLSM+IrTGAoSacrnxa1kK6IeGcv4i7f+UPpXBd8QU
	 gEmH8rg2eGi/V/MAQFp1iXlId/Ye6xklJP8Xc8t93mSbRQULkgW7kLv2sd7sKqWQLPISB
	 QPvB9WwTvGKlSRASc8HRjjhgbp74aM0nsYqcaOol6twyoElqu9I3Q2K3O5EYH/J/7GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=;
	b=oxPS7+vH/SpgadkpLTPwzd/J0KnDKE5NWEaM1hNvzFtYKNb7KMSEk8jaL98zThhsVsk9
	 fWzXXntG5tg+GIvX3U47r2ov9QaUtZD0KPuUFbXX92Vsxeb+wi/zvEc2skgWIvxl7/cr6
	 3N643500ahLqKS2+Xcj272r+jDYv9KUDzrHfJ2pg9zGYwpKV8nsWQlH3N4vAIw/EEov03
	 xmTwnJRmAaOjMsIHTT2bHRd3KZ9bFCWA+eDG2nyjy7zi4CzohiRA/X3WIu1R6qcukGsbo
	 ysVSm3udJ1sK+spS1lDqmOxmGm1jFTO5j1Gc9x90g0/hUBJpkRUfzlTcLzooyclUl4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1H6an7I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y/tnfK/7";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42140606A321
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42140606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1H6an7I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y/tnfK/7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5irRg3018424
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=; b=o1H6an7IgfbBc3Fg
	vlfoXAvTUpDuL1heAhVDCh5wJLq515VeQ4C5NUWW6fe5lxVJyeTtxtxtKlPXyx/O
	YVGaYp/IE5ZhQqcGhvGfJXBkYdgU0DQw22OKPOZrfjZMuMHAIRD17Vfsn02TfLcl
	DwLAsAbanueZvBdXMkCAfWij9RnXQzDRlv4tDampmgxXKtgRVKu0yoBouNqCP4+2
	IB9lLlHrr0ge93IT0sxURWemRfLcw+SKWwgxqn3Ai99bY8sBjcKeVBYENpMr+keh
	IclkpeNpj1lO+QeXatCQ/hfCunZ5JibSHaP/GCa5JcXtxVwTFoaNpGAPwE4mwQWH
	MCGJfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3qau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:42:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so179937485a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575769; x=1793180569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=;
        b=Y/tnfK/7lfCN2XLlXgVa62K/eJgoEyD7XuUT0jFWG1lgcsTk/859vKvkp/0RFPGZBZ
         x76+9UIrarNnB3t3sFuO7ZlMg+YOUPRlf3TmjunSZE7BQ4H5u+kKqLbNYFqxhYsRIlgW
         JT3qdVXZj/2eVuudoxT/ZxUYf16jlPxuth20Ngm8EHhcPnmpbhijGe+SIKvEYBK+2v2b
         9J++nFi5dJwM/PEacEFDWeKREmQKeDykfmn+I0GzHrmLmfNTlSo81vn1yDy4zXjmfR/q
         +5ki7uHFrIuXi7VWqgo8EUJCtTT4eUTJvnDwqxuAdZSEpzFD2LgMrnqs6JRXj+MyuO4E
         /kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575769; x=1793180569;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=;
        b=nbFsZ8HZYg6pneWqJY+bB5rDDkuP7mPgMHmfkoRfEll+CMEPSOFBCy0whM6/cN8nFx
         fXQjFd6WnfvqIVRMtdz0DInmChypgpIifFiFaQzVERUDbVNBqEanx2YG6tAnB7beBH1o
         iU3grIbeVly1EB035GwJNiyOaC91AzmAVTx+8XGkVi0rhTW929X0Dm+EyrNapNsOUrAR
         GQ/mN598/yMKWT1iD+q2IyJeJ9yKfGulxixXvcUF9MnUlQIuO6oPdySJy/YNAswItlDt
         qZJwrGSXZtsNOnMlqDAovsnmIj3B0B5haheZe3cV7wknIQNVC3I8hIj47f9FK4BSeghL
         niGA==
X-Gm-Message-State: AFq9FYIIUcp1zyLRCdsrF91xBox3I8K8bD3TGkb5E4xovsJvSnzYjX9A
	bfiNcJPcO9ZHSOy2P1e3/UJC528AT1IBh431Bbz2cnY0cwe3GKl9+2A5t5W1zeelrvhOv1de+N2
	FUcwbO0cejaSN8OHa0pTt7dVtNMtoL6J+9HsXvo3/unukFVtEnQQxTE06YutMnjrNUFYLcoXB
X-Gm-Gg: AYBFou2nrm6/1g7U2B92QbSb442n/3gVDcN/qG/MUNy5dFYcKqVtCajnmzLHE2rbnDv
	OqeY5h/kjcQPceSVWrZrozHOfFUIFhso/ifWc+PJLfgC+lb4PADjYRzlHh+7syGBCmjjVATS0/W
	GQyZ4Ikx59d+R8IDXyHJWWbiA2xH4BgOHOCOTszuUBmwfIQ9CwWcYZF37dx9WS1AddjIYMEn0cP
	YgQGZTTUy2Pqg2GTid5efMMX6Lx/0fMKuxVaH2IOyWI3BMET52uCkdrLS2kiesglTF1GrHMf3g8
	sI7vG02zI6uPwHAiCsPyIYf+RwrC+A3hQkSPILQ9y4l8OQa8zk8UDZ+5UD/869NkqYvB8my1Le0
	rE+BQ8tA/jL8H/sM4xcFlZ0CmEiQ=
X-Received: by 2002:a05:620a:438c:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-93f57f7fea9mr333179085a.61.1792575769492;
        Wed, 21 Oct 2026 02:42:49 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-93f57f7fea9mr333176585a.61.1792575769018;
        Wed, 21 Oct 2026 02:42:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200c1cc03sm7189075e9.0.2026.10.21.02.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:42:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: constify struct configfs_attribute
Date: Wed, 21 Oct 2026 11:42:46 +0200
Message-ID: <179257576412.11941.8262591385474559114.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
References: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX4bms/2DM18Un
 FFD7ZBIJ7fIWZgX8y7Tu/xzqTYLhJu7PKum1HI12h40v+UcG/owOGkRk3uP1hL9Po5lUSkgT7fx
 Mi0YHk01f//b/zC3pA9WQjpYNf7xPZiAldaYSzDjUrmKfB9Ox+PN0U0bnNBmNlKRJzYh9HBUhNs
 Z1d0MjpLy4Eo0on4NmPtQ3LmvZDeDPG/irHI5xpg3YMF9hcq4HIIwxVXUALgqr7+H1s60x6moUF
 bw/gkFTgUcPBXsgDLL8l4BcasJ+h4RO4dA+dueSt9abCxkI169vj8JiCODs2JWDbqps03T8Y7+E
 szGNJAjcuZ3JLxiyg0Kxar0Ifc3pdbMC7GxmR4Tu9FdxdEEQo8jtj0rME0PxmI/aKeEIkvczk7D
 dY4/cR9ySap1QHwWyQYxA9KyD/3FOy7RbrOwdYaolXTp7OO5o/HXrL7kBqJ1uIsv+ok2ntji/u/
 6er9k3VxWdzO1QJ9HXg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8891a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C7DGWjJ-WdxfBjvmcCAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gfS78GzTciRHQIMI7YhFGDRANilinYcL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX33ZV7nw3Qky5
 p4zPNU9wLkfctC3XJTyKmLqgDoDJt7Kox5B/WVBKMYiezTaCtoi0EYr/Xl6XdNvug9vk4Adc61c
 lwdGnKgg6K0Ic8wMKmLbN1IdZPiXeGg=
X-Proofpoint-GUID: gfS78GzTciRHQIMI7YhFGDRANilinYcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210038


On Tue, 20 Oct 2026 14:39:23 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-sim const and
> use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: sim: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/b57f502a681296be357e5c9dc72b53b083b26472

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
