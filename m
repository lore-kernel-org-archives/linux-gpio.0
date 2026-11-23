Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442953;
	b=bthpgCtq/yKMnkiFocfnjDXuqrEMzFtRgJGyJFq9W3nfaCACBLw+DiObMBHNlkheELkY
	 55uq4WMLB8xFVntarJs1WVVkIRI7Uq0Cq2eM0/XUtlWynf531qLro7Yo2gL7zyStgyhuf
	 mLiioeufRP7V55++JdPsD3BDIH8kxQVaUQnHHm/uftDGaH4h6hAYobgFetzUcyyyUfzHN
	 RoLW96rTQTElawTN+MZd3x1wwpMhI4BmSN8ib747wK9eNM/GFd8nraU/djapXEZeiqmNq
	 lxmMVvpiR6cLfRvUvk73G58ZH9KcGr0Doe476p96GEWIw6Qtu4WMiM3lLjBvHVfPYEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6QUawlYOLH86SJMkFqIW4lLF8j5WxWl6xHfhHqcDXOU=;
	b=syRzEMWXMby3zkDoBCVK8Nt11p2rZr++PS7Gs/kzBjK6mmTElIdXwKbzqrcDPONW0Au2
	 Hm4g8dgV0EN7fj8/XupPyhv7KUtQmVY+KMPTHRWELp4iibegPzW0DJjfC7tvuS0BuKYkL
	 4fKu2MzdOhEjq45RvNYAoRVBvxc/AHNWdK57JOJ9qLKFdnbk1oz0pJdL7UhXv3UYopGiT
	 n/B2JCZxqKTrId8lkkQgyemL0AEFYNpAfK0eyJ/MBLQAIS1W8JxMPWa1ttQTBr+BqYW8H
	 nIVKN5FH6NgzYZN3TZ40SeybibdqQYhO+LCpPxCGuJABrbzsNYGE0VmXLWDrMKLKGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwrD3Ktw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OZchAALR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CACE606A33A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CACE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwrD3Ktw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OZchAALR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLS8i1461855
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QUawlYOLH86SJMkFqIW4lLF8j5WxWl6xHfhHqcDXOU=; b=FwrD3Ktw1CSsYrMJ
	KCZKAxgN+G3Fheibhm468CS5l5zj/8Y6pO6KTv+6B0vkou0HdGW7VYNQapGgX90R
	V/7CC+YNklBOvMCQfhsPSLO+Xx6wvVrSb4EURY+RLdtgbMlOEzs4RUfdAyrL8d3T
	ghLaLQKn7PPavaAfGPrlLu+wsnN0XgFa96RmFdeZl/QbkIaEea0Fy1mKHtVfwaft
	4zL0oSmHaGctPKkpFY/Oz4K1JMKKGj2eZNPf643YiQ7Ren+bd9tSgmP567Sd/V4v
	nRU8UCcakFvHTe/Z8Rt7ND0VxFmjt4nxErXdkHSs0yBqsPF/yfDTyjkxEgQ/rJxP
	yxYJJA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1nxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:09:12 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b30ffeb2f5so45017957b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442952; x=1796047752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6QUawlYOLH86SJMkFqIW4lLF8j5WxWl6xHfhHqcDXOU=;
        b=OZchAALRtOHksy4QNQ211gjBRt5ErNr0K4DYwhaOXxMKf/SMl6UeVFaA2qBcHfimC3
         eiEVlMUTAPEHYuSeQcis3CU9b7pK17ZZqlBLm7l9zhRZJGCkyqmI8VYPUDgE+puuuGRi
         wENEXqsHBsxEYqlTGTKz3egY7K2anWcPy6VldEYl2Rhsh4czNIG795VBdK6RoOG/lI75
         YpbIBZnvBw7jUpBJ2elBdTa5679hmYmHFVV1RDp5S1CVlunD8XyVwkkbgy+NU27pfZT5
         yJ+y6aqt9C1Z7fQZ39ujWot445i/uLQpYQhIp69QrlV88sH45VY9Q4/UC2E5Ktal/SxF
         NOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442952; x=1796047752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QUawlYOLH86SJMkFqIW4lLF8j5WxWl6xHfhHqcDXOU=;
        b=mrAn+1v9l2/slmHPrMRPb0DGNmq69V8r24GY6tAErBvpiO++8Mkh0L7NWAlRlq486P
         81m0zy3XeCV0voGCTr8dRvbh0Q8Wbxkd1aY3OX9fijM/ufMolgozi6/NuKiSCBd19RO5
         DEiP+8Qx8/8w7JCjlUyKTQ04v0juhDCZ5OZuLy0JrM7kf9t/zkplmGt14Zr7hoUqI6QC
         dPKGp2MPePvxYmzDUb5vjg3SnPLRsiW52w90oO0wTnDODWnqYNQpLxZ9HDxb6ra5Dp+8
         iYy8Drtz0PqUgSpjiyRLg9cOV48WT+MS2vIauCey+jzwI6p6ZX5sIWpl8mcFUxmWWm9G
         DVnQ==
X-Forwarded-Encrypted: i=1; AL+hErF6KPETbSjsHYE7xXr3vHYEpA/qA2AnoVTxbgLUwt5oqf+n9oK23F5jATjaBPU2SpnmV24Bm5/UoouP@vger.kernel.org
X-Gm-Message-State: APuU4Z8srAEKiETAZg42H3MLRaaHZ8PXO4tjrBJtnJL4HKlGvf3UlSNd
	K0Tf8nJ+Lj7mwhpXzhxuscFFO0z6WtBOl9xkhXTu9u0uwDyeazqHW1GBbANrDdOdguXBmyHXZgZ
	T3MwPMlzM4pbWm5JrkNF6QkJcNjHKmPRnD5KUUWE4gKz3mkibCwEl0oUsQmfk+guV
X-Gm-Gg: AZFdTZdpwJd8uPXqjdeRnK7aMy1K6W9X++wCTDXsVnNdiEBUYL2tXMIJKpX1nlPjQod
	UEt/r8oHJjjmbyPGa7ulrjM0/9HyAqO4g+uN/bDFF0894zg4hTuBzCvOMHEeOEzWgMFGeCFUo4h
	VDJIRFbDNOy8RtwhX1cp6WLGlF07ga3YpkW70Vc7qUfdRuZLIV7JUbssf09SvC4KP3t/tMrYZJs
	mpinGCTK8Q7On0cwK2atgh2Kl2M3LY+Ms6lbz9okHU05SDRK/4+CRzzNMCoaUGhQMfdstLzpcv/
	WHKMlImz+4Ay7pV5tP3alpFqBvJyRGWTFElnTdU6HccPBz7RhqbvC8Y/3/haYHMDTkdTW3f1v4/
	wsSYgVgx4Ba+fogw1c2BpFZnlyi4vd+F6Kkuh6FCzZzjNOMattPw+QVDciiQsKKnauye4yJl0x7
	up
X-Received: by 2002:a05:690c:6504:b0:8b4:e905:e785 with SMTP id 00721157ae682-8b5204c4113mr47904927b3.43.1795442951770;
        Mon, 23 Nov 2026 06:09:11 -0800 (PST)
X-Received: by 2002:a05:690c:6504:b0:8b4:e905:e785 with SMTP id 00721157ae682-8b5204c4113mr47904587b3.43.1795442951188;
        Mon, 23 Nov 2026 06:09:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm23866920f8f.11.2026.11.23.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:09:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        warthog618@gmail.com, linusw@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: Return success after monitoring requested events
Date: Mon, 23 Nov 2026 15:09:03 +0100
Message-ID: <179544293817.66058.16938919730973458718.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120062107.98391-1-zhujun2@cmss.chinamobile.com>
References: <20261120062107.98391-1-zhujun2@cmss.chinamobile.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX6NAhofp9k1kP
 8adbRKH9KXcOPyy9t3roZA2YwidmvYBr1QQQpHg+Lall5dvgY1XsXx7rTQg4nyG+z5hneaMLNbb
 up/oXLeulChcVeeRy+nZWQoc0HAyPOM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX2gFFGILR3/tN
 VZU+F2m9CCQ11Yoi0Rh7vZ8A4Sc3nw1TQ3uIDIntpgs2SMSuIsMv7+B0wcNi+bVfKzHMPD145OB
 XJc/m8+I2pfs03N38ZGyR9oNRy4OSBIkupoLcyewMiYduqhq9X28jaNfgUXcpy2QEz+5Ai3qbDp
 6P6ER2jLJu2eNm4h17GT6K2PWc+4ourIMigTM0NDxcPYP/ODyS8oXlITt4O2bM+AXJSueTiPfbn
 46xp0IE0VdicAvKy10yOpBOUviI5zq5eOUpVT9EMQX76jKCDV11tkI7e+jbrD4Diaa68as4E34k
 kEo+ZL+oPIkWesHSq9M/QfsHlNWuLiHu//YWlS3HEH453ToEHxErRFLmNl8jj8wbp6F5/8uM1lE
 wkYB8SzTqjRLtSnydoK5IAYJ68tJEElFX5H9yD48Kj5Tm3LXsCU2Mv4K/b+lSTrqnMJaBzZpyDl
 4iUUTyr+AgBhLB2jPNg==
X-Proofpoint-ORIG-GUID: 2xyvNsegOJbJz8CSESBXdeAZvMd9wg1g
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b044908 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=S1PnvntQ62lC5BoAahMA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: 2xyvNsegOJbJz8CSESBXdeAZvMd9wg1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230056


On Fri, 20 Nov 2026 14:21:07 +0800, Zhu Jun wrote:
> After reading the requested number of events, monitor_device() returns
> the positive byte count left in ret by read(). main() passes this value
> through as the exit status, so a successful invocation with -c reports
> failure.
> 
> Clear ret when the event limit is reached, keeping read failures on their
> existing error paths.
> 
> [...]

Applied, thanks!

[1/1] tools: gpio: Return success after monitoring requested events
      https://git.kernel.org/brgl/c/1eaf27d99938dd30ea7855174b65e37a2503a349

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
