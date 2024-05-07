using Catalogservice as service from '../../srv/CatalogService';
 annotate service.POs with @(
    UI :{
        SelectionFields  : [
            PO_ID,
            PARTNER_GUID.ADDRESS_GUID.CITY,            
            LIFECYCLE_STATUS,
            OVERALL_STATUS,
            PARTNER_GUID.COMPANY_NAME
        ],
        LineItem: [
            {
            $Type : 'UI.DataField',
            Value : PO_ID
            },
                        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS
            },
                        {
            $Type : 'UI.DataField',
            Value : LIFECYCLE_STATUS,
            Criticality : Criticality,
            CriticalityRepresentation : #WithIcon
            },
                     {
            $Type : 'UI.DataFieldForAction',
            Label : 'Boost',
            Action : 'service.boost',
          Inline : true
         },
                        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.EMAIL_ADDRESS
            },
                                    {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME
            },
                        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.CITY
            },


            
        ],
       HeaderInfo  : {
           $Type : 'UI.HeaderInfoType',
           TypeName : 'Purchase Orders',
           TypeNamePlural : 'Purchase Orders',
           Title : {
               $Type : 'UI.DataField',
               Value : PO_ID,
           },
           Description :{
            Label : 'Supplier',
            Value :  PARTNER_GUID.COMPANY_NAME
           },
           ImageUrl : 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQBDgMBEQACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABgcBBQIDBAj/xABHEAABAwMABgYGBQgKAwEAAAABAAIDBAURBhIhMUFRB2FxgZGxExQiMqHRFlJyk8EjMzZCU1Vz0hUkNENigoOS4fA1ovEX/8QAGwEBAAIDAQEAAAAAAAAAAAAAAAUGAQMEAgf/xAAyEQABAwIEAwYGAgMBAAAAAAAAAQIDBBEFEiExE0FRFBUyUoGRIkJxobHBM/A0YdEj/9oADAMBAAIRAxEAPwDjlXI+bjKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKA4ZQ9jKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKA4ZQyMoDOUuDGUuZsZygsMoLKYyhgzlAMoDGUAygM5QDKXAylwMpcGMoBlAMoDOUuLDKXAylwMpcDKXM2MZQwMoBlAMoBlAMoBlAMoBlAMoDOUBwyFg9WGUFjvpKSprZPRUcEkz+TGk4XiSRkaXetjbFBJItmJckdBoHd6jDql0NK36rnazvAbPiuCTFIm+G6kpFg07rK5UT7r/fU20XR0zH5e5OPUyINHmVzriy8mfc6m4E35n/Y5P6OoNX8ncZWu5ujBHmETFnc2fcyuBMto/wCx46jo7rGtJpq6CR3ASMLPLK2NxZi+Jv3NL8DkTwPT2t/001dolfKPJdRGVg/WgcH57t/wXUyvgf8ANb6nDLhdUz5b/Q0kjHxPLJWOY4bw4YIXWioqXRThcxzVsqWOKyeLDIQzYZyQAOrtWDKISOLQm9yRMe2GIBwyA6UZXEuIwItrkm3CKlyXsnucvoNff2UH3wWO8oOqme56ronuPoNfP2UH3wTvKDqo7nquie5qLtaay0VLYK1gY9zdZpa7WDguiGoZMl2qclTSyU7rSHhyFvOWwyECIbGzWWuvT5W0DGOMQBfru1d+ceS0T1LILZ+Z101HLUX4fI2n0Gvv7KD74Ln7yg6qdXc9V0T3H0Gvv7KD74J3lB1Udz1XRPcfQa+/soPvgneUHVR3PVdE9wdB76BkQwnqEwWUxKn6hcHquie555NEL+wEm3uIH1ZWH4Ar0lfTL835NS4VVp8n3T/prKq219HtqqOeIc3xkDxW9s0b/C5FOaSlmj8TVPKtposMoLDIQWGQgsMhBYZCCwyEFhlBY9duttbc5HR0FO+ZzBl2rwHetUk0caXetjdFTyzKqRtvY8K2GuxKNE9FJbyRV1mtFRg8NjpOzkOtR9XWpD8LPES1Bhqz/G/Rv5LLoaCnoIBBSQsijHBo39vNQUkj5Fu5SzRRMiblYlkPUAV4NhlAEAQGHDKA8VxttHcItSup45RjYSNo7DvC2RyyRrdimmSGOVLPbcp2+Mo4bpURW1znUzHarXOOc43/ABVnp1e6JHP3UptW2JsypFsh4crcc9jcaJW/+k75TQkZjY70j+wf9C5ayXhRKp3YdBxqhqLshco3KsFyMoAgId0j271m0MrGt9uldkkfVO/8D3KRwyXJLkXZSIxeHiQ503QrLgrAVawygsTvorOam5fYj83KIxbZn96FgwPeT0/ZYahSwBAEAQGCMoDBbkEEDB4JtsYU0V40TtlzaSYGwTcJIRq47RuK64KyWJd7/U4qjD4Zk1Sy/wCitdILFV2OqEVSA6N/5uVvuu+RU7TVLJ23TcrNXRPpnWXVOpqsrpOOwygsMoLDKCwygNjYrPU3qtFPTD2RtkkO5gWiedkLMzjqpaR9RJlQty0WmntFG2mpGADe53F55lVqeZ07szy309OyBmRpUOj1tddrxBSbQ17syHk0bSrJUTcGJXFSpKfjTNZyLpggbBEyKJrWsYAGtbwAVXVVct1Lk1qNSycjuWD0Y1kB1S1MEP52VjPtOAXpGquyHlz2t3UMq6eT83NG77LgUVjk3QwkjV2U7Q4HdtXk9mNYJdARjTy+i12z1eF2KmpBa3H6reJ/BdtDT8WS67IRuJVXAism6lTlWQqa6qM9aCxY/RjbzHRVFwkbh0zvRsJ+q3f8dncoLFJcz0j6FkwaHJGsq8/wTkblFk0ZQBAeetpWVlJNTygFkrC0g9a9McrXI48PYj2q1eZRtbTyUdVNTyA60Lyw/NWxj87EcUiWNY3qxeR0ZXs12J50Un+s3L7Efm5RGLbM/vQn8E3f6fssVQpPhAYJwgGsEBjW6li/QGQcrIMoDX3m2wXagmpKgey8bHY2tPArZDKsT0ehpnhbMxWO5lKVtPJRVctNMMPieWu2K1RvR7UcnMpcsSxvVq8jpyvZrsMoLDKCxsbHZ6q91raalGBvklI9mMcz8lonqGQszOOmmpX1D8rS37NaKaz0jKakaA0e8473nmVWppnzOzOLdT07IGIxhsVqN5W3RZTh9ZW1LhksYGDPDJ/4U1ir1ytaQGCxpmc8slQpPmDuQEd05uVVbLC+ehyJHSNYZAPzYPH8O9dVFEySbK44cQmkigV0ZUUsz55PSzPdJIRtc85J7SVZWta1LN0Ko9znLdy3OsYG3AB6gsni576O9XOic11NXTsxwLyR4HYtL6eJ/iadEdXPH4XKSq09Ic8ZDLrTiZu70kWx3eFHzYYi6xqScOMKmkqexGL/AHWS8XSarkJDScRt5NG5d9NCkMaMQjauoWolV6muyt5ynOGN80scUQ1pZHBrG8yTgfFYc7KmZeR7YxXqjU5l52mgZbbZTUUXuwxhvaeJ7ztVTkesj1epdYokjjRibIe1eDaYygMoAgKs6Srf6rdmVbG4ZUs2n/ENh/BTuGS5o8i8it4xDllSROZDlJkMT3on/tVy+xH5uUTi3hZ/ehPYJ8/p+yx1Ck+EBGekOaWn0cdLBLJE8SsAdG8tPiF3Ye1HToipfcj8TcrKdVatluhV39LXIH/yFX9+/wCaneBF5U9kK12mfzr7m0tmmV4oZWl9QamLjHLtyOo81oloIZEsiWU6YcTnjW7luhalkuUN3tsVbT+5INx3tI2EHvVfmidE9WLyLNBMk0aPTme9azcYxtQFUdJFKKbSD0oGBPGHnrI2FT+GvV0KovIrGLxI2bMnNCJ5UkRK7jKwDZ2GzVN7rW09MMNG2STGxg5rRUVDIGZnHVS0j6h+VNi4LNaKaz0bKakaA0bXO4vPMqtzTPmdmcW2CBkDEYw2K1G4ICtuimpAqq6nO97GvHccfipnFW/C1xA4M9EVzCyVDE8EB01FPFUwvhqGNkieNV7HDIcOtZa5WrdNzy9jXNyu2K/vfR2dYyWWcY4U8x3djvn4qXgxTS0qepC1GEJe8S+hDbjZ7jbHFtbSSxD6xGQewjYpKOoik8LiIlpJovE08PDPBbjRYZ+KAE5QGMoYJX0c2312+ipe3MdI3X/zHYPxUfiM2SLL1JXCoc8uddmltt90KvlmMoCO6UX0WeptkYcB6zUasg1c/kxv+JC6qan4yPXohyVNTwXMS+6khBzuXKdZlARnT63ev6OzvaAZKb8s3sHvfDPguygl4cyJ1ODEYuLTu6pqU+D8FYyqKhPuiY/1q5/Yj83KJxXws/vQnMF+f0/ZZChieCAinSX+i7/4zPNd+G/z+ikdiv8AjL6FSEqwlWsAUMWLT6KiTo9UE5x627GfsM/5UDin8yfT9qWfCP4F+v6QmajSUCArTpXwLhQdcTs+Km8K8DvqV/GfG36KQPKlSENlYbNV3ysFPStwBtkkI9mNvM9fIf8A1aKioZA3M46aakfUPyt26lyWaz0tmomUtIMAbXvPvPdxJVbmmfM9XOLXBTsgYjGGxWo3hAEBRWjd2dZ7vT1hBLAdWRo4tO/wVoqYeNFlKhSTcGVHF309RHUQxzQOa+OQBzXA7wVWFRWqqLuhbmuRyIqbHcsGQgMYSwOEkTZG6jwHNO9pGQUTTYwqIu5H7voXZriC70Hq8p/vIfZ29m5dcVdNHzuhxzUEEu6WUgd+0Huds1pqceuU43ujHttHW3j3KVgxCOVbLopC1GGSxat1QiuV33I1UGdiyLFwdHdr9R0fZM8YlqXekd2bh8FXcQl4ktuhacNh4cCL11JUNi4SQMZQFPdIlx9d0lmjjd7FI0RN2/rb3HxOO5WHD4skF15lYxOXPUWTkWXovcBc7DSVIOS6PVd1OGwqEqY+HK5pYKaXixNcbdaTecHsDmOa4ZaRgjmiaLcwqIuilEX23m1XirotobC/DOtp2t+BCtUEnFjR6dCn1MPClcxSYdEn9ruf2I/NyjsV8LPX9Epg3z+hZShidCAifSaQNFn6xwPTM8134b/On0Uj8U/xlT6FQl7frt7yrAhV7G1s+j90u0zW0lM/UJ2zPaQxo5549y0TVMcKXcp0wUcsy2RC5bDbI7PaoKGLaIxtdj3nHaT4qtzSrK9XqWmCFIY0YnI2C1m4ICqOlCqbNfYoRsMMIB7TtU9hjVSJVK5i70WVG9ENBYLJVXyuFNSjDBgySEbGN/7uXXUVDYGZlOOmpXVD7JtzLms1opbPRMpaRuGj3nHe88yq3NM+Z+ZxaYYGQsyMNgtRuCAIAgPnPO1W8pBJ9E9MaixH1edrpqEnLo/1ozxLfl5bVw1VE2b4m6KSNFXOg+B2rfwWpab1Q3eATUFQyQcW7nN7RvCg5YZIls9CwRTxypdinvBytVzcckAQGCMoDGqMYRdQQrTfQ6GtikuFsiDKxo1nxt2CYfzeakqOuWNUY9dPwRVdQNkRZGJ8X5K4s9E+43SmomD2pZA0gjcOOe4KZmkSONXEJTxLJKjC+qeJkMLIoxhjGhrR1BVVVVVupb0SyWQ7FgyeavqmUVHUVU2yOGMvd2AZXpjVe5GoeHuRjFVSgJ531M8k8pzJK8vceZJyfiSrYxqNajU2KdI9XuVy8yxuie469PWW57vzThKzPI7x4jPeobFI9WvQnMJluxY15FhKKJgHcgK06Vrbqy0t0YN49DJ5tPxIUxhcuix+pB4tDtIg6IttXdOqOLzcs4rsz+9Bg/z+hZahicCA4vY2QYe0EciMoLXODaeJpyI2A/ZCzmU85W9DnqhebHoyBhZBlAeS41sNvpJqqpcGxRN1iV6jY6R6Mbup4kejGq53Ip2jo6/TC/TSQt1TK/XkkcMtibw7TjhxVjdIykhS5WmxPrZlVOZbdjs1JZbeyko2kNG17z70juJJ5qvzTOmfmcWKCBkLMrDZLUbggCAIAgPnDWVvKVYaxQHZT1M1LKJqaV8Ug3PYcFeXNRyWVLntj3MW7VsS60dIl1pMMq2x1kY3k7H+IXBLhsTl+BbEjDikrEs9LoS62dIdmrMMqHPo5D+1GW+IUfLh8zNU1JKLEYX76Epp6iKpibLTzRyxO3PjdrA94XErVatlQ7kc1dUU7QcrBkygOLhlYUEVtWjTaLTO4XER6sDog+HA2Bz86/hq/wDsu6WpV9M1nM4IqXJUuk5ErG5cR3mUBD+k6v8AVNHXQ5wamQMJ4Bo2n8F3YcxHToq8iPxJ6tgVE5lQAnqPYrDqVpURDf6CXH1HSijOfYmJhe3ecO3fHC5K6PPTr1Q7qB+SdOi6F4KtlnCA0+ldsF1sFZSgZeWa0f2htC300nClRxz1MSSxK0hfRD/bbqDsIZECDw2vUjiurWKn+/0RuEIqZ0X/AEWYocmggCAIAgME4QHhut2orTTGevqGxMG4He7qA4r3HE+VbMS5qlmZEl3rYrmvuNx09uooaBjobfE4OcTwH1ndfIKYZHHRR536uUh3ySVz8jNGliWSz0dnoGUtGzDd7nHe88yomWZ0zsziYhhbEzK02K1G0IAgCAIAgPm3Kt5S7HNrS4OIa5wa3LiB7o61hVsekYq8jhnltWTFjOUA1kB77Pea+zVQnt9Q6M5y+MnLJOojj5rTNAyZLOQ3wVEkK/CpetnrRcbbTVjWFgmjD9U8OpVmRmR6tLTG7OxHHtXg9hAYwEBlAEBhzWuBDgCDvBQwqIu54JbFZ5X68tpoHv8ArOpmE+S28eXzL7mtYIl3ansh6qekpqVurTU8ULeUbA0fBa3Oc7dT21jW7IdyweggMHcgIfotbP6L0vv0TW4ikbFLHyw4v/HK7qiXiU8a9Lp+Dhp4uHNInWy/kmK4TuCA1GlF6FgtZrnQmYCRrC0OxvW+nh4z8l7Giom4LM6oQ/8A/U4sbLW8/wCqPku/utfMcHerfKdUnSnJ/d2lna6oP8q9JhXV/wBjwuLdGfc09f0iX6qaWwvgpGHjDHl3i7Pkt8eHQNX4tTmkxKdyaaGts9tuWldzDfSySuH52omcXCNvf5BbpZY6Zl7WNMMMlU+1/UuSxWajslvZSUTMNG17z70juLieJVfmmdM7M4scMLIWZWGyGxajaEAQBAEAQBAfNWVbymlvdG9gZR2R1VVxAzVwDi1zdzP1R+PeoDEKhXy5WrohYqGnRkV3JuZvfR3bK5zpaB7qKV23DRlh/wAvDuSHEZI9HaoYmw6OTVuikQreju/07nehZT1Tf1fRyhp8HY81IMxKB2+hHyYZM3w6njZoLpMT7Vs1eszx/wAy99vp/N9lNfd899vuhurN0a18k7JLtPFBADl0cTtdzurO4LnlxRiJ/wCaanVDhb73k2LRpoY6eFkMLQ2ONoa1o4AblCqqqt1JpEREsh3LBkIAgCAIAgCAIAgCAwdyA6mwRipNQB+ULAwnmAc/iVnMtrGLJe53LBkICIdKf6Jv/jx+a7sO0n9FOHEf8dSmiVYStjWQG10bsdXpBcBS0rSGNw6WUj2Y29fXyHHxWioqGwNu46aendO7Khd1jtFHZqBlJRMw1vvOO955lVyWZ0rsziyRRMiblabEDG5ajaEAQBAEAQBAEBQmh1mN8vsNMW5gZ+UmPDVHDv3Ky1c/BiVefIrVHBxZETkXwxjWMDGtAaBgDqVaLKc0AQDAWLALICAIAgCAIDQaZaQDRy1iqEbZZnyBkUbnYDue3sBXRS0/HkyqtkOaqn4DMxGaPpTo3NaKy3VEbuJjeHAeOCux2Fv+VxyNxRnzIbNnSTo+QNaSpb/olau7pzd3hB1OqfpMscbcwtqpnchHjzwsphsy72MOxGFNjrsXSCy836noG0ZghlyA+ST2i7GwYHzSagWKLPmvYxDXpLLkRNCdqPJAIAgCAICH9Kn6JSfx4/Nd2H/z+inDiH8ClMEqwldNto1Yau/1wp6ZurG3bLMR7MY/E9S56iobA27jop6Z07rJsXfYbPR2W3Mo6GPVY05c4+893FxPNV2aZ8zszyxxRNiblabJajaEAQBAEAQBAEAQHz3o/pDX2CqM9A9gD8CSNwy14HxVnngZOlnlZgnfCvwllWbpLtFYGR3Nr6GY4GsRrxk/aG0d4GOaiJcNlbqzVCXixCJ+jtCYUVbSV8YmoqmGoiO58Tw4fBcDmOatnJY7WuRyXatz1LB6CAIDw3K6UFtj9JX1kFOznK8N8OZXtkb3rZiXPD3tYl3LYgmkPSdAxrorDC6Z+CPWJWlrR2N3nvx2FSMGGOVbykfNiLUS0e5u7JpfZIrVTNrr3BJU+jBlc4nOsdp4LnkpJlcqtbodEdTEjURztT3fTPRv98U3ifkvHY6jyqe+1Q+ZB9NNGv3xTeJ+SdjqPKo7TD5kKy6R9IIb3eo46KYS0VLGAx7fde921x8h3FS9BTrFGubdSIr5klejW7IRLPL4LuOBRlZMDKwD02+rNFcKeqYTrQSNfs5A/JeZGo9itNsTsr0cXezTTR1zGuN2p2kgEtJOz4Kudin2yqWJKqHzIcvpno3++KbxPyTsdR5VHaofMg+mejf74pvE/JOx1HlUdqh8yD6Z6N/vim8T8k7HUeVR2qHzIPpno3++KbxPyTsdR5VHaofMhGekTSOzXPRp9NQXCGeYysOownOAdq66Knljmu5LaKctbNG+FUatyBaN2Ks0huIpaRvsDbNMR7MTeZ69+Bx7MqTqKhsDcziLp6d0zsqbF5WG0Udlt7KOhj1WN95x3vPElVyWV8rszixRRtjblbsbFazYEAQBAEAQBAEAQBAfMWVbipDKyDlFLJDIJYZHxyDc9ji0+IXlUvuekVU2NtS6UX6lGILvV4/xyF+P92VpdSwO3ahvbUzN2cen6caSgYF4m+7j/lXhaKn8p77bP5jy1Ok99qm4nu9WRyZLqZ/24XttLC3Zp4dVTO3cap7y95e9xc873OOSe9bk00Q0LddVOOVk8jKAZQDKAZQDKAZQDKAZQDKAZQDKAZQDKCxuNGLBWaRV4p6VpbE3bLMR7LB8+paKiobA3M46aemdM6ybF52Cz0djt7aOhiDGDa5x957uLiearssz5XZnFgijbG3K3Y2S1GwIAgCAIAgCAIAgCAID5gyrcVSwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsbbRiwVukVxFLRt1WN2zTOHsxN6+Z5Dj2ZK0VE7IW5nHRBTuldZC97DZ6Sx0DKOhj1WN9559555k81XJZXSuzOJ+KNsbcrdjZLWbAgCAIAgCAIAgCAIAgCA+Xcq3FWsMoLDKCwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsMoLDKCwygsbnRfR6t0juApqVurG3bNMRsjHz6lz1FQyFt3G+CndK7TYvew2aksdAyjoY9VjdrnHe93Mnmq7LK+V+ZxPRxNjblabJazYEAQBAEAQBAEAQBAEAQBAfLStxVwgCAIAgCAIAgCAIAgCAIAgCAIAgCA5MGXAcysO2MpufRujlqo7NboqOgi1IwMkna554kniVVppXSSKrixQsa2NLG2Ws2hAEAQBAEAQBAEAQBAEAQBAf/2Q==',
       },
       Facets  : [
           {
               $Type : 'UI.CollectionFacet',
               Label : 'More Details',
               Facets : [
                   {
                       $Type : 'UI.ReferenceFacet',
                       Target : ![@UI.FieldGroup#MoreDetail],
                       Label : 'More Details'
                   },
                                      {
                       $Type : 'UI.ReferenceFacet',
                       Target : ![@UI.FieldGroup#SpecificDetail],
                       Label : 'specific details'
                   }
               ],
           },

           {
               $Type : 'UI.ReferenceFacet',
               Label: 'Line Items',
               Target : items.![@UI.LineItem]
           },
       ],

       FieldGroup #MoreDetail : {
           $Type : 'UI.FieldGroupType',
           Data : [
               {
                   $Type : 'UI.DataField',
                   Value : PO_ID,
               },
                              {
                   $Type : 'UI.DataField',
                   Value : PARTNER_GUID_NODE_KEY,
               },
                              {
                   $Type : 'UI.DataField',
                   Value : PARTNER_GUID.BP_ID,
               },
                              {
                   $Type : 'UI.DataField',
                   Value : PARTNER_GUID.COMPANY_NAME,
               },
                                             {
                   $Type : 'UI.DataField',
                   Value : LIFECYCLE_STATUS,
               }
           ],
       },
       FieldGroup#SpecificDetail  : {
           $Type : 'UI.FieldGroupType',
           Data : [
               {
                   $Type : 'UI.DataField',
                   Value : PARTNER_GUID.EMAIL_ADDRESS,
               },
                              {
                   $Type : 'UI.DataField',
                   Value : PARTNER_GUID.BP_ID,
               },
                              {
                   $Type : 'UI.DataField',
                   Value : LIFECYCLE_STATUS,
               },
                                             {
                   $Type : 'UI.DataField',
                   Value : OVERALL_STATUS,
               }
           ],
       },
    }
 ); 

@cds.odata.valuelist
annotate service.businesspartnerSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);

annotate service.POs with {
    PARTNER_GUID@(
        Common:{
            Text:  PARTNER_GUID.COMPANY_NAME,
            ValueList.entity: service.businesspartnerSet  
        },
           
    )
};


annotate service.PurchaseOrderItems with {
    PRODUCT_GUID@(
        Common:{
            Text:  PRODUCT_GUID.DESCRIPTION,
        },
        ValueList.entity: service.ProductSet
    )
};

 annotate service.PurchaseOrderItems with @(
    UI: {
     LineItem  : [
    {
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS,
    },
        {
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID_NODE_KEY,
    },
        {
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME
    },
        {
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID.DESCRIPTION,
    },

],
HeaderInfo  : {
    $Type : 'UI.HeaderInfoType',
    TypeName : 'Product details',
    TypeNamePlural : 'Product details',
    Title : {
        $Type : 'UI.DataField',
        Value :  NODE_KEY,
    },
    Description: {
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS
    },
      
    },
    Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : ![@UI.FieldGroup#productItems],
            Label : 'More info'
        },
    ],
    FieldGroup#productItems : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY
            },
                        {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.CATEGORY
            },
                        {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.CURRENCY_CODE
            },
                        {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRICE
            },
                        {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.DESCRIPTION
            },
        ]
    }
    }
    // },

 ) ;



 
 
 

